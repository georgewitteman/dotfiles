" Define user commands for updating/cleaning the plugins.
" Each of them calls PackInit() to load minpac and register
" the information of plugins, then performs the task.
command! PackUpdate call PackInit() | call minpac#update('', {'do': 'call minpac#status()'})
command! PackClean  call PackInit() | call minpac#clean()
command! PackStatus call PackInit() | call minpac#status()

function! PackInit() abort
  packadd minpac

  call minpac#init()
  call minpac#add('k-takata/minpac', {'type': 'opt'})

  " Additional plugins here.

  " Better syntax highlighting
  call minpac#add('rakr/vim-one')

  " Better syntax highlighting
  call minpac#add('pangloss/vim-javascript')
  call minpac#add('MaxMEllon/vim-jsx-pretty')
  call minpac#add('ericpruitt/tmux.vim')
  call minpac#add('Vimjas/vim-python-pep8-indent')
  call minpac#add('vim-python/python-syntax')
  call minpac#add('pboettch/vim-cmake-syntax')
  call minpac#add('stephpy/vim-yaml')
  call minpac#add('plasticboy/vim-markdown')
  call minpac#add('elzr/vim-json')
  call minpac#add('othree/html5.vim')
  call minpac#add('tpope/vim-git')
  call minpac#add('chrisbra/vim-zsh')

  " Surround something with text
  call minpac#add('tpope/vim-surround')

  " Comment a line with gcc (and other stuff)
  call minpac#add('tpope/vim-commentary')

  " Allow . to repeat for certain plugins
  call minpac#add('tpope/vim-repeat')

  " Better incremental searching
  call minpac#add('haya14busa/is.vim')

  " Git status in gutter
  call minpac#add('airblade/vim-gitgutter')

  " Git
  call minpac#add('tpope/vim-fugitive')

  " GitHub integration
  call minpac#add('tpope/vim-rhubarb')

  " Enable fzf support
  call minpac#add('junegunn/fzf.vim')

  " Tags
  " Use forked version for now to get rid of annoying ctags failed
  " messages in neovim
  " call minpac#add('ludovicchabant/vim-gutentags')
  call minpac#add('blueyed/vim-gutentags', {'branch': 'ignore-sigpipe-on-exit'})

  " Automatically :set paste
  call minpac#add('ConradIrwin/vim-bracketed-paste')

  " Better whitespace
  call minpac#add('ntpeters/vim-better-whitespace')

  " Caps Lock
  call minpac#add('tpope/vim-capslock')

  " File manager
  call minpac#add('justinmk/vim-dirvish')
endfunction

if empty(glob($VIMHOME.'/pack/minpac/opt/minpac/plugin/minpac.vim'))
  silent !git clone https://github.com/k-takata/minpac.git
        \ $VIMHOME'/pack/minpac/opt/minpac'
  call PackInit()
  call minpac#update()
endif
