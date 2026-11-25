" Copies a register to the system clipboard. Vim with a working clipboard
" (like macOS's) sets it directly, which works in any terminal. Elsewhere, or
" over SSH where that would be the remote machine's clipboard, it asks the
" terminal to do it with OSC 52.
function! s:CopyReg(reg) abort
  if has('clipboard_working') && empty($SSH_CONNECTION)
    " Keep the register's type, so a block yank pastes as a block. + is the
    " system clipboard's register, and getreg(..., 1, 1) returns the text as a
    " list of lines.
    call setreg('+', getreg(a:reg, 1, 1), getregtype(a:reg))
  else
    call OSCYankRegister(a:reg)
  endif
endfunction

" Copy plain yanks, not deletes or yanks into a named register like "a.
"
" TextYankPost runs after any yank or delete, and v:event says which operator
" (y for yank) and register ('' for the unnamed one) it used. ==# compares
" with case, '"' is the unnamed register's name, and <SID> calls this
" script's s: function. autocmd! first clears the group, so loading this again
" doesn't add the command twice.
augroup YankCmds
  autocmd!
  autocmd TextYankPost * if v:event.operator ==# 'y' && v:event.regname ==# '' | call <SID>CopyReg('"') | endif
augroup END
