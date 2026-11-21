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
  autocmd TextYankPost * if v:event.operator is 'y' && v:event.regname is 'c' | execute 'OSCYankReg c' | endif
augroup END
