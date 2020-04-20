" List of available normal mode mappings for future use :
"
" * cq, cu, cd, cm, c<CR>, c<, c>, c.
"
" * dq, dr, dy, du, dx, dc, dm, d<, d>, d.
"
" * gy, go, gz
"
" * yq, yr, yu, yx, yc, ym
"
" * zq, zy, zp

" Use repeat operator with visual selection {{{1
xnoremap . :normal! .<CR>

" To make Y inline with other capitals {{{1
nnoremap Y y$

" Q to :q<CR> a window {{{1
" nmap <expr> <silent> Q empty(maparg('q', 'n')) ? ':q<CR>' : 'q'
nnoremap Q :echo "Use :q instead"<CR>

" Dispatch {{{1
nnoremap d<CR> :Dispatch<CR>

" Gundo {{{1
" nnoremap U :GundoToggle<CR>
nnoremap U :MundoToggle<CR>

" Tabular {{{1
nnoremap <expr> z/ ':Tabular/'.nr2char(getchar()).'<CR>'
xnoremap <expr> z/ ':Tabular/'.nr2char(getchar()).'<CR>'
nnoremap z// :Tabular/
xnoremap z// :Tabular/

" Use ` when ' {{{1
nnoremap ' `

" Test {{{1
nnoremap <Leader>cl :TestLast<CR>
nnoremap <Leader>cf :TestFile<CR>
nnoremap <Leader>ca :TestSuite<CR>
nnoremap <Leader>cc :TestNearest<CR>

" Remap Esc in terminal for NeoVim
if exists(':tnoremap')
  tnoremap <Esc> <C-\><C-n>
endif

nnoremap g< <ESC>vap:Twrite bottom-left<CR>
xnoremap g< :Twrite bottom-left<CR>
nnoremap g> <ESC>vap:Twrite bottom-right<CR>
xnoremap g> :Twrite bottom-right<CR>

nnoremap <, :SidewaysLeft<CR>
nnoremap >, :SidewaysRight<CR>

nnoremap <silent> go :Goyo<CR>

cnoremap <C-P> <UP>

nnoremap <C-P> :Files<CR>
