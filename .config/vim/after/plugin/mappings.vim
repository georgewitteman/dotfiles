if exists(':Files')
  nnoremap <Leader>f :execute "Files"<CR>
  nnoremap <Leader>b :execute "Buffers"<CR>
  nnoremap <Leader>l :execute "Lines"<CR>
  nnoremap <Leader>t :execute "BTags"<CR>
  nnoremap <Leader>T :execute "Tags " expand("<cword>")<CR>
  nnoremap <Leader>s :execute "Rg"<CR>
  nnoremap <Leader>S :execute "Rg " expand("<cword>")<CR>
else
  echom 'nofiles'
endif

if exists('g:loaded_incsearch')
  map /  <Plug>(incsearch-forward)
  map ?  <Plug>(incsearch-backward)
  map g/ <Plug>(incsearch-stay)
else
  echom 'noincsearch'
endif
