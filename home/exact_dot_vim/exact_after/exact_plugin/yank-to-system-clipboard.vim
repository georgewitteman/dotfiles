" Copy to clipboard for yank commands
nnoremap <expr> y (v:register ==# '"' ? '"c' : '') . 'y'
nnoremap <expr> yy (v:register ==# '"' ? '"c' : '') . 'yy'
nnoremap <expr> Y (v:register ==# '"' ? '"c' : '') . 'Y'
xnoremap <expr> y (v:register ==# '"' ? '"c' : '') . 'y'
xnoremap <expr> Y (v:register ==# '"' ? '"c' : '') . 'Y'

augroup YankCmds
  autocmd!
  autocmd TextYankPost * if v:event.operator is 'y' && v:event.regname is 'c' | execute 'OSCYankReg c' | endif
  " autocmd TextYankPost * echo v:event
augroup END
