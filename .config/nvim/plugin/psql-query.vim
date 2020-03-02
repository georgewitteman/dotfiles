function s:PsqlQuery(svc)
  silent execute "!psql_query " . a:svc . " " . expand('%:p')
endfunction

command! -nargs=1 PsqlQuery call s:PsqlQuery(<f-args>)
