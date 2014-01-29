function! s:SetTitleString() "{{{1
  set titlestring=%f\ %m
  set titlestring+=\ -\ [%{split(substitute(getcwd(),$HOME,'~',''),'/')[-1]}]
endfunction

augroup SetTitleString "{{{2
  au!

  autocmd BufEnter * call s:SetTitleString()
augroup END

" :RFC Taken from tpope's config {{{1
command! -bar -count=0 RFC :e http://www.ietf.org/rfc/rfc<count>.txt | setl ro noma

function! s:OpenURL(url) "{{{1
  if has("win32")
    exe "!start cmd /cstart /b ".a:url.""
  elseif $DISPLAY !~ '^\w'
    exe "silent !sensible-browser \"".a:url."\""
  else
    exe "silent !sensible-browser -T \"".a:url."\""
  endif
  redraw!
endfunction
command! -nargs=1 OpenURL :call s:OpenURL(<q-args>)
" open URL under cursor in browser
nnoremap gb :OpenURL <cfile><CR>
nnoremap gA :OpenURL http://www.answers.com/<cword><CR>
nnoremap gG :OpenURL http://www.google.com/search?q=<cword><CR>
nnoremap gW :OpenURL http://en.wikipedia.org/wiki/Special:Search?search=<cword><CR>

nnoremap <Leader>jd :OpenURL http://api.jquery.com/?s=<cword><CR>
nnoremap <Leader>rd :OpenURL http://rubydoc.info/search/stdlib/core?q=<cword>&sa=Search<CR>
nnoremap <Leader>Rd :OpenURL http://api.rubyonrails.org/?q=<cword><CR>

function! NeatFoldText() "{{{1
  let line = ' ' . substitute(getline(v:foldstart), '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g') . ' '
  let lines_count = v:foldend - v:foldstart + 1
  let lines_count_text = '| ' . printf("%10s", lines_count . ' lines') . ' |'
  let foldchar = matchstr(&fillchars, 'fold:\zs.')
  let foldtextstart = strpart('+' . repeat(foldchar, v:foldlevel*2) . line, 0, (winwidth(0)*2)/3)
  let foldtextend = lines_count_text . repeat(foldchar, 8)
  let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
  return foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend
endfunction
set foldtext=NeatFoldText()

function! s:HasFolds() "{{{1
  if !empty(&buftype) | return 0 | endif
  let [v, flag] = [winsaveview(), 0]
  for mv in ['zj', 'zk']
    exe 'keepj norm!' mv
    if foldlevel('.') > 0
      let flag = 1
      break
    endif
  endfor
  call winrestview(v)
  return flag
endfunction

function! s:FoldColumnToggle()
  if s:HasFolds()
    if &fdc | setl fdc=0 | else | setl fdc=4 | endif
  endif
endfunction

function! s:FoldLevel()
  let level = nr2char(getchar())
  if level =~# '\d'
    let &foldlevel = level
  elseif level ==# 't' || level ==# 'c'
    call s:FoldColumnToggle()
  endif
endfunction
nnoremap <silent> <Leader>fl :<C-U>call <SID>FoldLevel()<CR>

" Fugitive gems {{{1
function! s:GitShortRefNames(names, full_name) "{{{2
  if a:full_name
    let expr = 'v:val[11:]'
  else
    let expr = 'v:val[strridx(v:val, "/")+1:]'
  endif
  return map(a:names, expr)
endfunction

function! s:GitComplete(ArgLead, Cmdline, Cursor, ...) "{{{2
  if exists('b:git_dir')
    let path = b:git_dir
  else
    let path = fugitive#extract_git_dir('.')
  endif
  let path = path[:strridx(path, '/')]

  let refs = 'refs/heads/'
  if a:0 == 1 && a:1 !=? 'branch'
    let refs = 'refs/' . a:1
    let full_name = 1
  elseif a:0 == 2 && a:1 ==? 'branch'
    let refs = refs . a:2
    let full_name = 0
  endif

  let cmd = 'cd ' . path
  let cmd = cmd . '; git for-each-ref --format="%(refname)" ' . refs
  if !empty(a:ArgLead)
    let cmd = cmd . ' | sed "s/.*\/\(.*\)/\1/" | grep ^' . a:ArgLead . ' 2>/dev/null'
  endif
  return s:GitShortRefNames(split(system(cmd)), full_name)
endfunction

function! s:GitBranchComplete(ArgLead, CmdLine, Cursor) "{{{2
  return s:GitComplete(a:ArgLead, a:CmdLine, a:Cursor, 'branch')
endfunction

function! s:GitBugComplete(ArgLead, CmdLine, Cursor) "{{{2
  if (empty(a:ArgLead) || a:ArgLead =~? '^f\%[inish]$') && a:CmdLine !~? 'finish\s*$'
    return ['finish']
  else
    return s:GitComplete(a:ArgLead, a:CmdLine, a:Cursor, 'branch', 'bug')
  endif
endfunction

function! s:GitFeatureComplete(ArgLead, CmdLine, Cursor) "{{{2
  if (empty(a:ArgLead) || a:ArgLead =~? '^f\%[inish]$') && a:CmdLine !~? 'finish\s*$'
    return ['finish']
  else
    return s:GitComplete(a:ArgLead, a:CmdLine, a:Cursor, 'branch', 'feature')
  endif
endfunction

function! s:GitRefactorComplete(ArgLead, CmdLine, Cursor) "{{{2
  if (empty(a:ArgLead) || a:ArgLead =~? '^f\%[inish]$') && a:CmdLine !~? 'finish\s*$'
    return ['finish']
  else
    return s:GitComplete(a:ArgLead, a:CmdLine, a:Cursor, 'branch', 'refactor')
  endif
endfunction

" Commands {{{2
command! -bar -nargs=* Gpull execute 'Git pull' <q-args> 'origin' fugitive#head()
command! -bar -nargs=* Gpush execute 'Git push' <q-args> 'origin' fugitive#head()
command! -bar -nargs=* Gpurr execute 'Git pull --rebase' <q-args> 'origin' fugitive#head()
command! Gpnp silent! Gpull | Gpush
command! Gprp silent! Gpurr | Gpush

command! -bar -nargs=+ -complete=customlist,s:GitBugComplete Gbug Git bug <q-args>
command! -bar -nargs=1 -complete=customlist,s:GitBranchComplete Gcheckout Git checkout <q-args>
command! -bar -nargs=+ -complete=customlist,s:GitFeatureComplete Gfeature Git feature <q-args>
command! -bar -nargs=+ -complete=customlist,s:GitRefactorComplete Grefactor Git refactor <q-args>

" Previewing Markdown Files (with github styles) {{{1
function! s:Preview()
  if executable('gfm')
    exe 'silent !gfm < '.expand('%').' > /tmp/'.expand('%:t:r').'.html'
    exe 'silent !sensible-browser /tmp/' . expand('%:t:r') . '.html'
    redraw!
  endif
endfunction
nnoremap <silent> <Leader>pm :<C-U>call <SID>Preview()<CR>

" Randon Number {{{1
function! Rand()
  return str2nr(matchstr(reltimestr(reltime()), '\v\.@<=\d+')[1:])
endfunction

" Toggle Ruby Hash Syntax {{{1
function! s:RubyHashSyntaxToggle() range
  if join(getline(a:firstline, a:lastline)) =~# '=>'
    silent! execute a:firstline . ',' . a:lastline . 's/[^{,]*[{,]\?\zs:\([^: ]\+\)\s*=>/\1:/g'
  else
    silent! execute a:firstline . ',' . a:lastline . 's/[^{,]*[{,]\?\zs\([^: ]\+\):/:\1 =>/g'
  endif
endfunction
command! -bar -range RubyHashSyntaxToggle <line1>,<line2>call s:RubyHashSyntaxToggle()
noremap <Leader>rh :RubyHashSyntaxToggle<CR>

" Copy current file with line number {{{1
function! s:CopyFileNameWithLineNumber() range
  let name_with_lnum = expand('%') . ':'
  if a:lastline == a:firstline
    let name_with_lnum .= a:firstline
  else
    let name_with_lnum .= a:firstline . '-' . a:lastline
  endif
  let @+ = name_with_lnum
  echomsg @+ . ' Copied to clipboard'
endfunction
command! -range CopyFileNameWithLineNumber <line1>,<line2>call s:CopyFileNameWithLineNumber()
noremap <Leader>y :CopyFileNameWithLineNumber<CR>

" Filter quickfix list {{{1
function! s:FilterQuickfixList(bang, pattern)
  let cmp = a:bang ? '!~#' : '=~#'
  call setqflist(filter(getqflist(), "bufname(v:val['bufnr']) " . cmp . " a:pattern"))
endfunction
command! -bang -nargs=1 -complete=file QFilter call s:FilterQuickfixList(<bang>0, <q-args>)

" Filter location list {{{1
function! s:FilterLocationList(bang, pattern)
  let cmp = a:bang ? '!~#' : '=~#'
  call setloclist('%', filter(getloclist('%'), "bufname(v:val['bufnr']) " . cmp . " a:pattern"))
endfunction
command! -bang -nargs=1 -complete=file LFilter call s:FilterLocationList(<bang>0, <q-args>)

" MyTabLine {{{1
" Based on : http://www.offensivethinking.org/data/dotfiles/vimrc
function! MyTabLine()
  let s = ''
  for i in range(tabpagenr('$'))
    let tabnr = i + 1 " range() starts at 0
    let winnr = tabpagewinnr(tabnr)
    let buflist = tabpagebuflist(tabnr)
    let bufnr = buflist[winnr - 1]
    let bufname = fnamemodify(bufname(bufnr), ':t')

    let s .= '%' . tabnr . 'T'
    let s .= (tabnr == tabpagenr() ? '%#TabLineSel#' : '%#TabLine#')
    let s .= ' ' . tabnr

    let n = tabpagewinnr(tabnr,'$')
    if n > 1 | let s .= ':' . n | endif

    let bufmodified = getbufvar(bufnr, "&mod")
    let s .= empty(bufname) ? ' [No Name] ' : ' ' . bufname . ' '
    if bufmodified | let s .= '+ ' | endif
  endfor
  let s .= '%#TabLineFill#'
  return s
endfunction
set tabline=%!MyTabLine()
