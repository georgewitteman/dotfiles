" Sort directories at the top of dirvish
let g:dirvish_mode = ':sort ,^.*[\/],'

" Disable netrw if dirvish is installed
if !empty(glob('~/.vim/plugged/vim-dirvish'))
  let loaded_netrwPlugin = 1
endif
