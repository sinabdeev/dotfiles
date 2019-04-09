function! s:PackInit()
  packadd minpac

  call minpac#init()
  call minpac#add('k-takata/minpac', {'type': 'opt'})

  " Plugs {{{1
  " tpope plugins {{{2
  call minpac#add('tpope/vim-rsi')
  call minpac#add('tpope/vim-rake')
  call minpac#add('tpope/vim-tbone')
  call minpac#add('tpope/vim-rbenv')
  call minpac#add('tpope/vim-apathy')
  call minpac#add('tpope/vim-repeat')
  call minpac#add('tpope/vim-abolish')
  call minpac#add('tpope/vim-endwise')
  call minpac#add('tpope/vim-rhubarb')
  call minpac#add('tpope/vim-dispatch')
  call minpac#add('tpope/vim-fugitive')
  call minpac#add('tpope/vim-sensible')
  call minpac#add('tpope/vim-surround')
  call minpac#add('tpope/vim-fireplace')
  call minpac#add('tpope/vim-leiningen')
  call minpac#add('tpope/vim-obsession')
  call minpac#add('tpope/vim-commentary')
  call minpac#add('tpope/vim-scriptease')
  call minpac#add('tpope/vim-unimpaired')
  call minpac#add('tpope/vim-speeddating')
  call minpac#add('tpope/vim-projectionist')
  call minpac#add('tpope/vim-characterize')

  call minpac#add('tpope/vim-haml')
  call minpac#add('tpope/vim-rails')
  call minpac#add('tpope/vim-eunuch')
  call minpac#add('tpope/vim-bundler')
  call minpac#add('tpope/vim-cucumber')
  call minpac#add('tpope/vim-classpath')

  " Other plugins {{{2
  call minpac#add('w0rp/ale')
  call minpac#add('mxw/vim-jsx')
  call minpac#add('kana/vim-vspec')
  call minpac#add('benmills/vimux')
  call minpac#add('rbong/vim-flog')
  call minpac#add('janko-m/vim-test')
  if has('nvim')
    call minpac#add('kassio/neoterm')
  endif
  call minpac#add('majutsushi/tagbar')

  call minpac#add('SirVer/ultisnips')
  call minpac#add('honza/vim-snippets')

  call minpac#add('ctrlpvim/ctrlp.vim')
  call minpac#add('wellle/targets.vim')
  call minpac#add('vim-scripts/DrawIt')
  call minpac#add('avdgaag/vim-phoenix')
  call minpac#add('digitaltoad/vim-jade')
  call minpac#add('diepm/vim-rest-console')
  call minpac#add('powerman/vim-plugin-AnsiEsc')
  call minpac#add('tommcdo/vim-exchange')
  call minpac#add('elixir-lang/vim-elixir')
  call minpac#add('AndrewRadev/switch.vim')
  call minpac#add('AndrewRadev/sideways.vim')
  call minpac#add('slim-template/vim-slim')
  call minpac#add('guns/vim-clojure-static')
  call minpac#add('guns/vim-sexp')
  call minpac#add('tpope/vim-sexp-mappings-for-regular-people')
  call minpac#add('kchmck/vim-coffee-script')
  call minpac#add('AndrewRadev/splitjoin.vim')

  call minpac#add('mattn/gist-vim')
  call minpac#add('mattn/webapi-vim')

  call minpac#add('fatih/vim-go', {'do': 'GoUpdateBinaries'})
  call minpac#add('sjl/gundo.vim')
  call minpac#add('junegunn/goyo.vim')
  call minpac#add('godlygeek/tabular')
  call minpac#add('rust-lang/rust.vim')
  call minpac#add('derekwyatt/vim-scala')
  call minpac#add('burnettk/vim-angular')
  call minpac#add('racer-rust/vim-racer')
  call minpac#add('RRethy/vim-hexokinase')
  call minpac#add('pangloss/vim-javascript')
  call minpac#add('guns/xterm-color-table.vim')
  call minpac#add('leafgarland/typescript-vim')
  call minpac#add('purescript-contrib/purescript-vim')
  call minpac#add('neoclide/coc.nvim', {'do': { -> 'call coc#util#install()'}})
  call minpac#add('Lenovsky/nuake')
  " call minpac#add('autozimu/LanguageClient-neovim', {
  "       \ 'branch': 'next',
  "       \ 'do': {-> system('bash install.sh')},
  "       \ })
  " }}}2
endfunction

command! PackUpdate source ~/.vim/packs.vim | call s:PackInit() | call minpac#update('', {'do': 'call minpac#status()'})
command! PackClean  source ~/.vim/packs.vim | call s:PackInit() | call minpac#clean()
command! PackStatus source ~/.vim/packs.vim | call s:PackInit() | call minpac#status()
