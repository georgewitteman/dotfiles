" Shortcut to source (reload) THIS configuration file after editing it: (s)ource (c)onfiguraiton
nnoremap <silent> <Leader>r :source $MYVIMRC<CR>:echo "Sourced $MYVIMRC!"<CR>

" Quickly echo the full file path
nnoremap <leader>% :let @*=expand("%:p")<CR>:echo expand('%:p')<CR>
nnoremap <leader>5 :let @*=expand("%:p")<CR>:echo expand('%:p')<CR>

" Don't use C-c for escape
noremap <C-c> <Nop>
noremap! <C-c> <Nop>

" Have Y yank from cursor to end of the line (like C[hange] and D[elete])
nnoremap Y y$

" Copy to clipboard for yank commands
if has('clipboard')
  nnoremap <expr> y (v:register ==# '"' ? '"+' : '') . 'y'
  nnoremap <expr> yy (v:register ==# '"' ? '"+' : '') . 'yy'
  nnoremap <expr> Y (v:register ==# '"' ? '"+' : '') . 'Y'
  xnoremap <expr> y (v:register ==# '"' ? '"+' : '') . 'y'
  xnoremap <expr> Y (v:register ==# '"' ? '"+' : '') . 'Y'
endif

" Add new lines without entering insert mode
nnoremap [<Space> :call append(line('.')-1, '')<CR>k
nnoremap ]<Space> :call append(line('.'), '')<CR>j

nnoremap <Leader>f :execute "Files"<CR>
nnoremap <Leader>b :execute "Buffers"<CR>
nnoremap <Leader>l :execute "Lines"<CR>
nnoremap <Leader>t :execute "BTags"<CR>
nnoremap <Leader>T :execute "Tags " expand("<cword>")<CR>
nnoremap <Leader>s :execute "Rg"<CR>
nnoremap <Leader>S :execute "Rg " expand("<cword>")<CR>
