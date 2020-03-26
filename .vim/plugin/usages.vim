function! s:Usages(cmd, args)
  let l:grepargs = empty(a:args) ? expand("<cword>") : a:args . join(a:000, ' ')
  if l:grepargs == ""
    echo "No keyword found."
    return
  endif

  let l:grepprg = &grepprg
  " References to a keyword will almost always be delimited by a word boundary
  " (--word-regexp) and in the same case as the input keyword
  " (--case-sensitive)
  set grepprg=rg\ --vimgrep\ --word-regexp\ --case-sensitive
  silent execute a:cmd l:grepargs
  bot cwindow
  redraw!
  let &grepprg = l:grepprg
endfunction

command! -bang -nargs=* -complete=file Usages call s:Usages('grep<bang>', <q-args>)
command! -bang -nargs=* -complete=file Used call s:Usages('grep<bang>', <q-args>)
command! -bang -nargs=* -complete=file Use call s:Usages('grep<bang>', <q-args>)

nnoremap <Leader>u :Usages!<CR>
