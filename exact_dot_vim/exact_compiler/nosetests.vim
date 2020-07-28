if exists("current_compiler")
  finish
endif
let current_compiler = "nosetests"

CompilerSet makeprg=nosetests\ --nologcapture

" Vim errorformat cheatsheet:
" %-G		ignore this message
" %+G		general message
" %.%#          .*

" CompilerSet errorformat=
CompilerSet errorformat+=%f:%l:%m:  " traceback lines including file locations
CompilerSet errorformat+=file\ %f\\,\ line\ %l  " location when pytest complains about a missing fixture
CompilerSet errorformat=%A\ \ File\ \"%f\"\\,\ line\ %l\\,\ %m  " normal python tracebacks from the logging output
