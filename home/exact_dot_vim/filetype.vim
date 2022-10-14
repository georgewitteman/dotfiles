" Based on an example in `:h filetype`.
if exists("did_load_filetypes")
  finish
endif

augroup filetypedetect
  autocmd!

  autocmd! BufNewFile,BufRead *.jsx set filetype=javascript.jsx
  autocmd! BufNewFile,BufRead devcontainer.json set filetype=jsonc
augroup END
