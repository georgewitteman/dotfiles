command! Executable call system('chmod +x ' . expand('%:p:S')) | if v:shell_error | echoerr 'chmod failed' | endif
