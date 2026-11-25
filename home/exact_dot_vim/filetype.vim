if exists("did_load_filetypes")
  finish
endif

augroup filetypedetect
  autocmd! BufNewFile,BufRead devcontainer.json setfiletype jsonc
augroup END
