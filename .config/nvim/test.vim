" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
" Avoid side effects when it was already reset
if &compatible
  set nocompatible
endif

" Enable filetype detection
filetype plugin indent on

augroup VimStartup
  autocmd!
  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid, when inside an event handler
  " (happens when dropping a file on gvim) and for a commit message (it's
  " likely a different one than last time).
  autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
    \ |   exe "normal! g`\""
    \ | endif
augroup END

" Ignore case in search patterns. Also used when searching in the tags file
set ignorecase
" Overrides the 'ignorecase' option if the search pattern contains upper case
" characters
set smartcase
" While typing a search command, show where the pattern, as it was typed so
" far, matches. The matched string is highlighted
set incsearch

" Turn on line numbers
set number
" Change the displayed number to be relative to the cursor. When this option
" and the 'number' option are on, the current line has the real number
set relativenumber

" Turn on syntax highlighting
syntax enable

" Show the line and column number of the cursor position, separated by a comma
set ruler

" Use the appropriate number of spaces to insert a <Tab>
set expandtab

" Allow backspacing over everything in insert mode
" indent: allow backspacing over autoindent
" eol: allow backspacing over line breaks (join lines)
" start: allow backspacing over the start of insert
set backspace=indent,eol,start

" Time out when waiting for mappings and key codes (requires timeout == off)
set ttimeout
" The time in ms that is waited for a key code or mapped key sequence to complete
set ttimeoutlen=100

" Show a few lines of context around the cursor.  Note that this makes the
" text scroll if you mouse-click near the start or end of the window
set scrolloff=3

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

" Don't make a backup before overwriting a file
set nobackup
" Don't make a backup before overwriting a file (this option will delete the
" backup after the file has been written if on)
set nowritebackup

" If this many miliseconds nothing is typed the swap file will be written
" to disk. Also used for the CursorHold autocommand event
set updatetime=200

" Highlight the text line of the cursor with CursorLine
set cursorline

" Describe how autoformatting is to be done
" r: automatically insert the current comment leader after hitting <Enter> in
"    insert mode
" o: automatically insert the current comment leader after hitting 'o' or 'O'
"    in insert mode
" See https://stackoverflow.com/a/8748154 for the autocommand explanation.
" Basically it gets overwritten sometimes. The autocmd just makes it stick
augroup FormatOptions
  autocmd!
  autocmd BufNewFile,BufRead * setlocal formatoptions-=ro
augroup END

" Number of lines to scroll with CTRL-U and CTRL-D commands. Setting to 0
" means scroll half the window height
set scroll=0

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

" Don't expand certain files
set wildignore=*.o,*.obj,*.bak,*.exe,*.pyc

" Always show sign column
" Doesn't exist on certain vim versions
if exists('&signcolumn')
  set signcolumn=yes
endif

" Display incomplete commands
set showcmd
