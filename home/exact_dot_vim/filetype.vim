if exists("did_load_filetypes")
  finish
endif

augroup filetypedetect
  autocmd! BufNewFile,BufRead devcontainer.json setfiletype jsonc

  " netrw runs `:filetype detect` after opening a file, which only runs this
  " group, not chezmoi.vim's own, so Vim's *.tmpl rule would win. The source
  " directory is checked when a file is read, since chezmoi.vim sets it up
  " after this file runs.
  autocmd BufRead *
        \ if exists('g:chezmoi#source_dir_path') && stridx(expand('<amatch>:p'), g:chezmoi#source_dir_path . '/') == 0 |
        \   call chezmoi#filetype#handle_chezmoi_filetype() |
        \ endif
augroup END
