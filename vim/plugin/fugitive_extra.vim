function! s:close_gstatus()
  for l:winnr in range(1, winnr('$'))
    if !empty(getwinvar(l:winnr, 'fugitive_status'))
      execute l:winnr.'close'
    endif
  endfor
endfunction
command! GstatusClose call s:close_gstatus()

" Commands & Mappings {{{1
command! -bar -nargs=* Gpurr Gpull --rebase
command! -bar Gpnp silent Gpull | Gpush
command! -bar Gprp silent Gpurr | Gpush
command! -bar Gush silent Gpush origin head

nnoremap gsl :Glog<CR>
nnoremap gsd :Gdiff<CR>
nnoremap gse :Gedit<CR>
nnoremap gsb :Gblame<CR>
nnoremap gsw :Gwrite<CR>
nnoremap gsC :Gcommit<CR>
nnoremap gst :Gstatus<CR>
nnoremap gsq :GstatusClose<CR>
nnoremap gscd :Gcd<Bar>pwd<CR>
nnoremap gsld :Glcd<Bar>pwd<CR>
