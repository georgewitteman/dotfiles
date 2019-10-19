" Copy to clipboard for yank commands
if has('clipboard')
  nnoremap <expr> y (v:register ==# '"' ? '"+' : '') . 'y'
  nnoremap <expr> yy (v:register ==# '"' ? '"+' : '') . 'yy'
  nnoremap <expr> Y (v:register ==# '"' ? '"+' : '') . 'Y'
  xnoremap <expr> y (v:register ==# '"' ? '"+' : '') . 'y'
  xnoremap <expr> Y (v:register ==# '"' ? '"+' : '') . 'Y'
endif
