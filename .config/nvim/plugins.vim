if empty(glob($VIMHOME.'/autoload/plug.vim'))
  silent !curl -fLo $VIMHOME/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin($VIMHOME.'/plugged')

" Better syntax highlighting
Plug 'rakr/vim-one'

" Better syntax highlighting
Plug 'pangloss/vim-javascript'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'ericpruitt/tmux.vim'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'vim-python/python-syntax'
Plug 'pboettch/vim-cmake-syntax'
Plug 'stephpy/vim-yaml'
Plug 'plasticboy/vim-markdown'
Plug 'elzr/vim-json'
Plug 'othree/html5.vim'
Plug 'tpope/vim-git'
Plug 'chrisbra/vim-zsh'
Plug 'lifepillar/pgsql.vim'
Plug 'saltstack/salt-vim'

" Surround something with text
Plug 'tpope/vim-surround'

" Comment a line with gcc (and other stuff)
Plug 'tpope/vim-commentary'

" Allow . to repeat for certain plugins
Plug 'tpope/vim-repeat'

" Better incremental searching
Plug 'haya14busa/is.vim'

" Git status in gutter
Plug 'airblade/vim-gitgutter'

" Git
Plug 'tpope/vim-fugitive'

" GitHub integration
Plug 'tpope/vim-rhubarb'

" Enable fzf support
Plug 'junegunn/fzf.vim'

" Tags
" Use forked version for now to get rid of annoying ctags failed
" messages in neovim
Plug 'ludovicchabant/vim-gutentags'

" Automatically :set paste
Plug 'ConradIrwin/vim-bracketed-paste'

" Better whitespace
Plug 'ntpeters/vim-better-whitespace'

" Caps Lock
Plug 'tpope/vim-capslock'

" File manager
Plug 'justinmk/vim-dirvish'

" Dispatch
Plug 'tpope/vim-dispatch'

" dadbod.vim (Database query runner)
Plug 'tpope/vim-dadbod'

" dotenv.vim
Plug 'tpope/vim-dotenv'

" Tests
Plug 'janko/vim-test'

" Show the context
Plug 'wellle/context.vim'

" Language servers
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

" Python motions
Plug 'jeetsukumaran/vim-pythonsense'

" Let's try an auto pairs plugin again
Plug 'Krasjet/auto.pairs'

" Smooth scrolling
Plug 'psliwka/vim-smoothie'

" Initialize plugin system
call plug#end()
