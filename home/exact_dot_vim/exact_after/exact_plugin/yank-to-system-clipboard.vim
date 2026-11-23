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

" Vim before 8.0 has no TextYankPost. Without it, yanks would go to register c
" but never reach the clipboard, so leave yanking alone there.
if !exists('##TextYankPost')
  finish
endif

" Copy to clipboard for yank commands
nnoremap <expr> y (v:register ==# '"' ? '"c' : '') . 'y'
nnoremap <expr> yy (v:register ==# '"' ? '"c' : '') . 'yy'
nnoremap <expr> Y (v:register ==# '"' ? '"c' : '') . 'Y'
xnoremap <expr> y (v:register ==# '"' ? '"c' : '') . 'y'
xnoremap <expr> Y (v:register ==# '"' ? '"c' : '') . 'Y'

augroup YankCmds
  autocmd!
  autocmd TextYankPost * if v:event.operator is 'y' && v:event.regname is 'c' | CopyReg c | endif
augroup END
