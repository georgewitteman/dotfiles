" Copies a register to the system clipboard. Vim with a working clipboard
" (like macOS's) sets it directly, which works in any terminal. Elsewhere, or
" over SSH where that would be the remote machine's clipboard, it asks the
" terminal to do it with OSC 52.
function! s:CopyReg(reg) abort
  if has('clipboard_working') && empty($SSH_CONNECTION)
    call setreg('+', getreg(a:reg))
  else
    execute 'OSCYankReg' a:reg
  endif
endfunction
command! -nargs=1 CopyReg call s:CopyReg(<q-args>)

" Copy plain yanks, not deletes or yanks into a named register like "a
augroup YankCmds
  autocmd!
  autocmd TextYankPost * if v:event.operator ==# 'y' && v:event.regname ==# '' | CopyReg " | endif
augroup END
