function s:PsqlQuery(svc)
  let cmd = 'psql-query ' . a:svc . ' ' . expand('%:p')
  if exists(':Dispatch')
    execute 'Dispatch! ' . cmd
  else
    execute '!' . cmd
    redraw!
  endif
endfunction

command! -nargs=1 PsqlQuery call s:PsqlQuery(<f-args>)
