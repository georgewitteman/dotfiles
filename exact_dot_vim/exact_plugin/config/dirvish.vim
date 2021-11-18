" Sort directories at the top of dirvish
let g:dirvish_mode = ':sort ,^.*[\/],'

" Disable netrw if dirvish is installed
if exists("loaded_dirvish")
  let loaded_netrwPlugin = 1
endif
