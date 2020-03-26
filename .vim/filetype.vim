" my filetype file
if exists('did_load_filetypes')
  finish
endif

augroup filetypedetect
  autocmd!
  autocmd! BufNewFile,BufRead *.jsx set filetype=javascript.jsx
  autocmd! BufNewFile,BufRead plugins set filetype=vplug
augroup END
