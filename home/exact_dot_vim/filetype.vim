" Vim reads this file before its own filetype detection. did_load_filetypes is
" set once detection has loaded, so this stops (finish) if it already has.
if exists("did_load_filetypes")
  finish
endif

" devcontainer.json allows comments, so open it as jsonc (JSON with comments)
" instead of JSON. autocmd! BufNewFile,BufRead runs the command when a file by
" that name is created or opened, and setfiletype sets the filetype only if
" nothing else has.
augroup filetypedetect
  autocmd! BufNewFile,BufRead devcontainer.json setfiletype jsonc
augroup END
