" my filetype file
if exists('did_load_filetypes')
  finish
endif

augroup filetypedetect
  autocmd!
  autocmd! BufNewFile,BufRead *.jsx set filetype=javascript.jsx
augroup END
