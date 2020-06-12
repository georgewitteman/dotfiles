" my filetype file
if exists('did_load_filetypes')
  finish
endif

augroup filetypedetect
  autocmd!
  autocmd! BufNewFile,BufRead *.jsx set filetype=javascript.jsx
  autocmd! BufNewFile,BufRead plugins set filetype=vplug
  autocmd! BufNewFile,BufRead requirements3.txt set filetype=requirements
  autocmd! BufNewFile,BufRead requirements-3.txt set filetype=requirements
  autocmd! BufNewFile,BufRead dev-requirements3.txt set filetype=requirements
  autocmd! BufNewFile,BufRead dev-requirements-3.txt set filetype=requirements
augroup END
