if exists("current_compiler")
  finish
endif
let current_compiler = "nosetests"

CompilerSet makeprg=nosetests\ --nologcapture

" Vim errorformat cheatsheet:
" %-G		ignore this message
" %+G		general message
" %.%#          .*

CompilerSet errorformat=%f:%l:%m  " traceback lines including file locations
CompilerSet errorformat+=file\ %f\\,\ line\ %l  " location when pytest complains about a missing fixture
CompilerSet errorformat+=%-G=%#\ FAILURES\ =%#  " FAILURES header
CompilerSet errorformat+=%-G=%#\ ERRORS\ =%#  " ERRORS header
CompilerSet errorformat+=%-G\C%[FEs.]%#\ %#[%[0-9]%#%%]  " ...F..E..     [100%] results list
CompilerSet errorformat+=%-G%*[FEs.]  " single results without percentage
CompilerSet errorformat+=%-G\ \ \ \ %.%#  " traceback rows including code
CompilerSet errorformat+=%-G%.%#\ seconds,  " last '1 error in 0.53 seconds' line
CompilerSet errorformat+=%-GRan%.%#\ tests\ in\ %.%#s,  " last 'Ran X tests in Xs' line
CompilerSet errorformat+=%-GFAILED%.%#,  " last 'FAILED (errors=1)' line
CompilerSet errorformat+=%-G%.%#Traceback%.%#,
CompilerSet errorformat+=%-G%*[=-],
CompilerSet errorformat+=%A\ \ File\ \"%f\"\\,\ line\ %l\\,\ %m  " normal python tracebacks from the logging output

"CompilerSet errorformat+=%-G______%#\ %m\ ______%#  " test name header
