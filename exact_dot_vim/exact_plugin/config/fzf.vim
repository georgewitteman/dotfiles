if executable('project-grep')
  command! -bang -nargs=* Rg call fzf#vim#grep('project-grep '.shellescape(<q-args>), 1, fzf#vim#with_preview(), <bang>0)
endif
