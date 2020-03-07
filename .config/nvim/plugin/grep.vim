function! s:Grep(cmd, args)
  let l:grepargs = empty(a:args) ? expand("<cword>") : a:args . join(a:000, ' ')
  if l:grepargs == ""
    echo "No regular expression found."
    return
  endif

  " The grep! form of grep doesn't jump to first result automatically
  silent execute a:cmd l:grepargs | botright copen | redraw!
endfunction

command! -bang -nargs=* -complete=file Grep call s:Grep('grep<bang>', <q-args>)
