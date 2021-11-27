augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init({'wrap': 'soft'})
  autocmd Filetype git,gitsendemail,*commit*,*COMMIT* call pencil#init({'wrap': 'soft'})
  autocmd FileType arcanist* call pencil#init({'wrap': 'soft'})
  autocmd FileType html call pencil#init({'wrap': 'soft'})
augroup END
