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

" Add new lines without entering insert mode
nnoremap [<Space> :call append(line('.')-1, '')<CR>k
nnoremap ]<Space> :call append(line('.'), '')<CR>j
