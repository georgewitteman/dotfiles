function s:SnowSQLQuery()
  let cmd = 'snowsql-query ' . expand('%:p')
  if exists(':Dispatch')
    execute 'Dispatch! ' . cmd
  else
    execute '!' . cmd
    redraw!
  endif
endfunction

command! SnowSQLQuery call s:SnowSQLQuery()
