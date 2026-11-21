function s:Executable()
  call system('chmod +x ' . shellescape(expand('%:p')))
  if v:shell_error
    echo 'chmod failed'
  endif
endfunction

command! -nargs=0 Executable call s:Executable()
