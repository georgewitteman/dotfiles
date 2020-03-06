scriptencoding utf-8

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
" Avoid side effects when it was already reset.
if &compatible
  set nocompatible
endif

let $VIMHOME = $XDG_CONFIG_HOME.'/nvim'

" Environment
set undodir=$XDG_DATA_HOME/nvim/undo
set directory=$XDG_DATA_HOME/nvim/swap
set backupdir=$XDG_DATA_HOME/nvim/backup
set runtimepath=$XDG_CONFIG_HOME/nvim,$VIMRUNTIME,$XDG_CONFIG_HOME/nvim/after
if has('nvim')
  set viminfo+='1000,n$XDG_DATA_HOME/nvim/shada
else
  set viminfo+='1000,n$XDG_DATA_HOME/nvim/viminfo
endif
set packpath^=$VIMHOME

" Homebrew fzf
set runtimepath+=/usr/local/opt/fzf

let g:python_host_prog  = $VIMHOME.'/python2-venv/bin/python'
let g:python3_host_prog = $VIMHOME.'/python3-venv/bin/python'

source $VIMHOME/plugins.vim

" Set 24-bit colors
if (has('termguicolors'))
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" Leader to <Space>
let mapleader = "\<Space>"

" No swapfiles
set noswapfile

" Better indenting
filetype plugin indent on

" Set the right filetypes
augroup FiletypeGroup
  autocmd!
  au BufNewFile,BufRead *.jsx set filetype=javascript.jsx
augroup END

" Turn on syntax highlighting
syntax on

" Set colorscheme
set background=dark
if (has('termguicolors'))
  let g:one_allow_italics = 1
  colorscheme one
endif

" Set font
if has('gui_macvim')
  set guifont=OperatorMonoLig-Book:h14
endif

" spaces/tabs setup
" tabstop: How many whitespace characters a literal \t is worth
" shiftwidth: how many columns of whitespace a level of indentation is worth
"             (>, <, ...). If negative, use value of shiftwidth
" softtabstop: how many columns of whitespace a keypress is worth (<Tab>)
" expandtab: Always use spaces instead of tabs
" smarttab: Insert and delete shiftwidth blanks
" autoindent: Copy indent from current line when starting a new line
" smartindent: Do smart autoindenting by inserting extra tab when necessary
set tabstop=8
set shiftwidth=2
set softtabstop=-1
set expandtab
set smarttab
set autoindent
set nosmartindent

" don't use backup files
set nobackup
set nowritebackup

" How often to update git-gutter (and other stuff)
set updatetime=200

" turn on git-gutter by default
let g:gitgutter_enabled = 1

" Better searching in vim
set ignorecase
set smartcase

" Highlight the current line
set cursorline

" Incremental search
set incsearch

" Disable comment continuation
" r       Automatically insert the current comment leader after hitting
"         <Enter> in Insert mode.
" o       Automatically insert the current comment leader after hitting 'o' or
"         'O' in Normal mode.
set formatoptions-=ro

" Turn on hybrid relative numbers (current line shows actual number not 0)
set number rnu

" Show trailing whitespaces
set list

" Trailing whitespace characters and tab characters
set listchars=tab:»·,trail:·

" Scroll half the scren with CTRL-D and CTRL-U
set scroll=0

" Better command line autocompletion menu
" https://stackoverflow.com/a/13043196
set wildmenu
set wildmode=longest:full,full

" Enable mouse support for all modes
if has('mouse')
  set mouse=a
endif

" Split below and to the right
set splitbelow
set splitright

" Enable folding based on indentation
set foldmethod=indent
set foldlevel=99

" Character timeout length
" https://stackoverflow.com/questions/2158516/delay-before-o-opens-a-new-line
set ttimeoutlen=100

" Don't expand certain files
set wildignore=*.o,*.obj,*.bak,*.exe,*.pyc

" Always show sign column
" Doesn't exist on certain vim versions
if exists('&signcolumn')
  set signcolumn=yes
endif

" Allow backspacing over everything in insert mode
" indent: allow backspacing over autoindent
" eol: allow backspacing over line breaks (join lines)
" allow backspacing over the start of insert
set backspace=indent,eol,start

" Persistent Undo
set undofile

" Display incomplete commands
set showcmd

" Better vertical character
set fillchars+=vert:│

" Don't add tags file to home directory
let g:gutentags_exclude_project_root = ['/usr/local', $HOME]

" Enable better whitespace plugin
let g:better_whitespace_enabled = 1
let g:strip_whitespace_on_save = 1
let g:strip_whitespace_confirm = 0 " Don't ask for confirmation
let g:strip_whitelines_at_eof = 1 " Strip white lines at end of file

if filereadable($VIMHOME.'/env.vim')
  source $VIMHOME/env.vim
endif
