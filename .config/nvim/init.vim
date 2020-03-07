scriptencoding utf-8

let $VIMHOME = $XDG_CONFIG_HOME.'/nvim'

" Environment
" Persistent Undo
set undodir=$XDG_DATA_HOME/nvim/undo
set undofile " Automatically save undo history to an undo file. Stored in 'undodir'
set directory=$XDG_DATA_HOME/nvim/swap " List of dir names for the swap file
set noswapfile " No swapfiles
set backupdir=$XDG_DATA_HOME/nvim/backup " List of dir names for the backup file
set runtimepath=$XDG_CONFIG_HOME/nvim,$VIMRUNTIME,$XDG_CONFIG_HOME/nvim/after
if has('nvim')
  set viminfo+='1000,n$XDG_DATA_HOME/nvim/shada/main.shada
else
  set viminfo+='1000,n$XDG_DATA_HOME/nvim/viminfo
endif
set packpath^=$VIMHOME

" Homebrew fzf
set runtimepath+=/usr/local/opt/fzf

let g:python_host_prog  = $VIMHOME.'/python2-venv/bin/python'
let g:python3_host_prog = $VIMHOME.'/python3-venv/bin/python'

runtime! plugins.vim

" Set 24-bit colors
if (has('termguicolors'))
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" Leader to <Space>
let mapleader = "\<Space>"

" Turn on file type detection and loading ftplugin and indent files
filetype plugin indent on

" Turn on syntax highlighting
syntax on

" Set colorscheme
set background=dark
if (has('termguicolors'))
  let g:one_allow_italics = 1
  colorscheme one
endif

" How many whitespace characters a literal \t is worth
set tabstop=8
" How many columnsof whitespace a level of indentation is worth (>, <, ...).
set shiftwidth=2
" How many columns of whitespace a keypress is worth (<Tab>). If negative, use
" the value of shiftwidth
set softtabstop=-1
" Always use spaces instead of tabs
set expandtab
" Insert and delete shiftwidth blanks
set smarttab
" Copy indent from current line when starting a newline
set autoindent
" (Don't) do smart indenting by inserting an extra tab when necessary
set nosmartindent

" When a file has been detected to have been changed outside of Vim and it has
" not been changed inside of Vim, automatically read it again
set autoread

" Don't make a backup before overwriting a file
set nobackup
" Don't make a backup before overwriting a file (this option will delete the
" backup after the file has been written if on)
set nowritebackup

" If this many miliseconds nothing is typed the swap file will be written
" to disk. Also used for the CursorHold autocommand event
set updatetime=200

" turn on git-gutter by default
let g:gitgutter_enabled = 1

" Ignore case in search patterns. Also used when searching in the tags file
set ignorecase
" Overrides the 'ignorecase' option if the search pattern contains upper case
" characters
set smartcase

" Highlight the text line of the cursor with CursorLine
set cursorline

" While typing a search command, show where the pattern, as it was typed so
" far, matches. The matched string is highlighted
set incsearch

" Disable comment continuation
" r       Automatically insert the current comment leader after hitting
"         <Enter> in Insert mode.
" o       Automatically insert the current comment leader after hitting 'o' or
"         'O' in Normal mode.
" See https://stackoverflow.com/a/8748154 for the autocommand explanation
augroup FormatOptions
  autocmd!
  autocmd BufNewFile,BufRead * setlocal formatoptions-=ro
augroup END

" Turn on line numbers
set number
" Change the displayed number to be relative to the cursor. When this option
" and the 'number' option are on, the current line has the real number
set relativenumber

" Show trailing whitespaces
set list

" Trailing whitespace characters and tab characters
set listchars=tab:»·,trail:·

" Number of lines to scroll with CTRL-U and CTRL-D commands. Setting to 0
" means scroll half the window height
set scroll=0

" Better command line autocompletion menu
" When 'wildmenu' is on, command-line completion operates in an enhanced mode
" https://stackoverflow.com/a/13043196
set wildmenu
set wildmode=longest:full,full

" Don't expand certain files
set wildignore=*.o,*.obj,*.bak,*.exe,*.pyc

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

" Time out when waiting for mappings and key codes (requires timeout == off)
set ttimeout
" The time in ms that is waited for a key code or mapped key sequence to complete
set ttimeoutlen=100

" Always show sign column. Doesn't exist on certain vim versions
if exists('&signcolumn')
  set signcolumn=yes
endif

" Allow backspacing over everything in insert mode
" indent: allow backspacing over autoindent
" eol: allow backspacing over line breaks (join lines)
" start: allow backspacing over the start of insert
set backspace+=indent
set backspace+=eol
set backspace+=start

" Show (partial) command in the last line of the screen
set showcmd

" Characters to fill the statuslines and vertical separators
set fillchars+=vert:│

" Minimal number of columns for the current window (default 20)
set winwidth=90
" Minimal number of rows for the current window (default 1)
set winheight=30
" The minimal height of a window, when it's not the current window. This is a
" hard minimum, windows will never become smaller (default 1, 0-3 reasonable)
set winminheight=3
" The minimal width of a window, when it's not the current window. This is a
" hard minimum, windows will never become smaller (default 1, 0-12 reasonable)
set winminwidth=13

" Status line of current window
hi StatusLine guifg=#ABB2BF guibg=#3E4452
" Status lines of the not-current window
hi StatusLineNC guibg=#6E7A91 guifg=#353A46

" Always display the status line
set laststatus=2

" Set the contents of the status line
set statusline=[%n]\ %<%.99f
set statusline+=\ %{exists('*FugitiveStatusline')?FugitiveStatusline():''}
set statusline+=%y%h%w%m%r
set statusline+=%{exists('*CapsLockStatusline')?CapsLockStatusline():''}
set statusline+=%{exists('*gutentags#statusline')?gutentags#statusline('[',']'):''}
set statusline+=%=\ %(%l,%c%V%)\ %P

" Quickly echo the full file path
nnoremap <leader>% :let @*=expand("%:p")<CR>:echo expand('%:p')<CR>
nnoremap <leader>5 :let @*=expand("%:p")<CR>:echo expand('%:p')<CR>

" Don't use C-c for escape
noremap <C-c> <Nop>
noremap! <C-c> <Nop>

" Have Y yank from cursor to end of the line (like C[hange] and D[elete])
nnoremap Y y$

" Add new lines without entering insert mode
nnoremap [<Space> :call append(line('.')-1, '')<CR>k
nnoremap ]<Space> :call append(line('.'), '')<CR>j

runtime! env.vim
