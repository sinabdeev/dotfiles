packadd cfilter
packadd packup

call packup#init()

" Plugins {{{1
call packup#add('git@github.com:dhruvasagar/packup.git', {'type': 'opt'})

" tpope plugins {{{2
call packup#add('git@github.com:tpope/vim-rsi.git')
call packup#add('git@github.com:tpope/vim-rake.git')
call packup#add('git@github.com:tpope/vim-tbone.git')
call packup#add('git@github.com:tpope/vim-rbenv.git')
call packup#add('git@github.com:tpope/vim-apathy.git')
call packup#add('git@github.com:tpope/vim-repeat.git')
call packup#add('git@github.com:tpope/vim-abolish.git')
call packup#add('git@github.com:tpope/vim-endwise.git')
call packup#add('git@github.com:tpope/vim-rhubarb.git')
call packup#add('git@github.com:tpope/vim-dispatch.git')
call packup#add('git@github.com:tpope/vim-fugitive.git')
call packup#add('git@github.com:tpope/vim-sensible.git')
" call packup#add('git@github.com:tpope/vim-surround.git')
call packup#add('git@github.com:tpope/vim-fireplace.git')
call packup#add('git@github.com:tpope/vim-leiningen.git')
call packup#add('git@github.com:tpope/vim-obsession.git')
call packup#add('git@github.com:tpope/vim-commentary.git')
call packup#add('git@github.com:tpope/vim-scriptease.git')
call packup#add('git@github.com:tpope/vim-unimpaired.git')
call packup#add('git@github.com:tpope/vim-speeddating.git')
call packup#add('git@github.com:tpope/vim-projectionist.git')
call packup#add('git@github.com:tpope/vim-characterize.git')
call packup#add('git@github.com:tpope/vim-sexp-mappings-for-regular-people.git')

call packup#add('git@github.com:tpope/vim-haml.git')
call packup#add('git@github.com:tpope/vim-rails.git')
call packup#add('git@github.com:tpope/vim-eunuch.git')
call packup#add('git@github.com:tpope/vim-bundler.git')
call packup#add('git@github.com:tpope/vim-cucumber.git')
call packup#add('git@github.com:tpope/vim-markdown.git')
call packup#add('git@github.com:tpope/vim-classpath.git')
" }}}2

" Other plugins {{{2
" call packup#add('git@github.com:mxw/vim-jsx.git', {'for': 'javascript'})
call packup#add('git@github.com:MaxMEllon/vim-jsx-pretty.git', {'for': 'javascript'})
call packup#add('git@github.com:kana/vim-vspec.git')
call packup#add('git@github.com:benmills/vimux.git')
call packup#add('git@github.com:SirVer/ultisnips.git')
call packup#add('git@github.com:janko-m/vim-test.git')
call packup#add('git@github.com:majutsushi/tagbar.git')
call packup#add('git@github.com:dense-analysis/ale.git')
call packup#add('git@github.com:honza/vim-snippets.git')
call packup#add('git@github.com:wellle/targets.vim.git')
call packup#add('git@github.com:vim-scripts/DrawIt.git')
call packup#add('git@github.com:avdgaag/vim-phoenix.git')
call packup#add('git@github.com:digitaltoad/vim-jade.git')
call packup#add('git@github.com:tommcdo/vim-exchange.git')
call packup#add('git@github.com:diepm/vim-rest-console.git')
call packup#add('git@github.com:elixir-lang/vim-elixir.git')
call packup#add('git@github.com:AndrewRadev/switch.vim.git')
call packup#add('git@github.com:slim-template/vim-slim.git')
call packup#add('git@github.com:AndrewRadev/sideways.vim.git')
call packup#add('git@github.com:powerman/vim-plugin-AnsiEsc.git')

call packup#add('git@github.com:guns/vim-sexp.git')
call packup#add('git@github.com:guns/vim-clojure-static.git')

call packup#add('git@github.com:kchmck/vim-coffee-script.git')
call packup#add('git@github.com:AndrewRadev/splitjoin.vim.git')
call packup#add('git@github.com:editorconfig/editorconfig-vim.git')

call packup#add('git@github.com:mattn/gist-vim.git')
call packup#add('git@github.com:mattn/webapi-vim.git')

call packup#add('git@github.com:fatih/vim-go.git', {'do': 'GoInstallBinaries'})
" call packup#add('git@github.com:sjl/gundo.vim.git')
call packup#add('git@github.com:simnalamburt/vim-mundo.git')
call packup#add('git@github.com:junegunn/goyo.vim.git')
call packup#add('git@github.com:godlygeek/tabular.git')
call packup#add('git@github.com:rust-lang/rust.vim.git')
call packup#add('git@github.com:racer-rust/vim-racer.git')
call packup#add('git@github.com:derekwyatt/vim-scala.git')
call packup#add('git@github.com:burnettk/vim-angular.git')
call packup#add('git@github.com:RRethy/vim-hexokinase.git', {'do': { -> system('make hexokinase')}})
call packup#add('git@github.com:pangloss/vim-javascript.git', {'for': 'javascript'})
call packup#add('git@github.com:guns/xterm-color-table.vim.git')
call packup#add('git@github.com:leafgarland/typescript-vim.git')
call packup#add('git@github.com:purescript-contrib/purescript-vim.git')
call packup#add('git@github.com:Lenovsky/nuake.git')

call packup#add('/usr/local/opt/fzf')
call packup#add('git@github.com:junegunn/fzf.vim.git')
call packup#add('git@github.com:rbong/vim-flog.git')
call packup#add('git@github.com:machakann/vim-sandwich.git')
call packup#add('git@github.com:rhysd/devdocs.vim.git')
call packup#add('git@github.com:airblade/vim-gitgutter.git')
call packup#add('git@github.com:dstein64/vim-win.git')
call packup#add('git@github.com:vim-scripts/SyntaxRange.git')
call packup#add('git@github.com:vimwiki/vimwiki.git')
call packup#add('git@github.com:mattn/calendar-vim.git')

call packup#add('git@github.com:neoclide/coc.nvim.git', {'branch': 'release'})
"}}}2

" Color Schemes {{{2
call packup#add('git@github.com:arzg/vim-colors-xcode.git')
call packup#add('git@github.com:sonph/onehalf.git', {'rtp': 'vim'})
" }}}2

" My plugins {{{2
call packup#add('git@github.com:groenewege/vim-less.git')
call packup#add('git@github.com:dhruvasagar/vim-marp.git')
call packup#add('git@github.com:dhruvasagar/vim-zoom.git')
call packup#add('git@github.com:dhruvasagar/vim-dotoo.git')
" call packup#add('git@github.com:dhruvasagar/vim-markify.git')
call packup#add('git@github.com:dhruvasagar/vim-pairify.git')
call packup#add('git@github.com:dhruvasagar/vim-testify.git')
call packup#add('git@github.com:dhruvasagar/vim-open-url.git')
call packup#add('git@github.com:dhruvasagar/vim-table-mode.git')
call packup#add('git@github.com:dhruvasagar/vim-buffer-history.git')
call packup#add('git@github.com:dhruvasagar/vim-railscasts-theme.git')
call packup#add('git@github.com:dhruvasagar/vim-github-review.git')
call packup#add('git@github.com:dhruvasagar/vim-comp.git')

call packup#add('git@github.com:dhruvasagar/vim-prosession.git', {'type': 'opt'})
" }}}2
" }}}1

call packup#autoremove()
