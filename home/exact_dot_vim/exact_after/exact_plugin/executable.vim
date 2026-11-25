" :Executable makes the current file executable. expand('%:p:S') is its full
" path (:p), quoted for the shell (:S), and v:shell_error is chmod's exit
" status. | separates commands on one line.
command! Executable call system('chmod +x ' . expand('%:p:S')) | if v:shell_error | echoerr 'chmod failed' | endif
