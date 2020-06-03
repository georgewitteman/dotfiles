function s:Isort() abort
  if ! executable('isort')
    echo 'Command not found: isort'
    return
  endif

  execute 'silent !isort %'
  redraw!
  edit!
endfunction

command! Isort call s:Isort()
