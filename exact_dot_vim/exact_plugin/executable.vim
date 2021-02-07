function s:Executable()
  let cmd = 'chmod +x ' . expand('%:p')
  if exists(':Dispatch')
    execute 'Dispatch! ' . cmd
  else
    execute '!' . cmd
    redraw!
  endif
endfunction

command! -nargs=0 Executable call s:Executable()
