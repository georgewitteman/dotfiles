function s:PsqlQuery(svc)
  let cmd = 'psql_query ' . a:svc . ' ' . expand('%:p')
  if exists(':Start')
    execute 'Start! ' . cmd
  else
    execute '!' . cmd
    redraw!
  endif
endfunction

command! -nargs=1 PsqlQuery call s:PsqlQuery(<f-args>)
