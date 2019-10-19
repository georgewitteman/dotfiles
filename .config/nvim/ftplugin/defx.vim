" Define mappings
nnoremap <silent><buffer><expr> <CR>
    \ defx#is_directory() ? defx#do_action('open_or_close_tree') : defx#do_action('open')
nnoremap <silent><buffer><expr> gn
    \ defx#do_action('open')
nnoremap <silent><buffer><expr> -
    \ defx#do_action('cd', ['..'])
nnoremap <silent><buffer><expr> c
    \ defx#do_action('change_vim_cwd')
nnoremap <silent><buffer><expr> d
    \ defx#do_action('new_directory')
nnoremap <silent><buffer><expr> D
    \ defx#do_action('remove')
nnoremap <silent><buffer><expr> a
    \ defx#do_action('toggle_ignored_files')
nnoremap <silent><buffer><expr> gh
    \ defx#do_action('toggle_ignored_files')
nnoremap <silent><buffer><expr> s
    \ defx#do_action('toggle_sort', 'time')
nnoremap <silent><buffer><expr> S
    \ defx#do_action('toggle_sort', 'extension')
nnoremap <silent><buffer><expr> %
    \ defx#do_action('new_file')
nnoremap <silent><buffer><expr> <C-l>
    \ defx#do_action('redraw')
nnoremap <silent><buffer><expr> o
    \ defx#do_action('open', 'split')
nnoremap <silent><buffer><expr> v
    \ defx#do_action('open', 'vsplit')
nnoremap <silent><buffer><expr> t
    \ defx#do_action('open', 'tabnew')
nnoremap <silent><buffer><expr> p
    \ defx#do_action('open', 'pedit')
nnoremap <silent><buffer><expr> X
    \ defx#do_action('execute_system')
nnoremap <silent><buffer><expr> yy
    \ defx#do_action('yank_path')
nnoremap <silent><buffer><expr> i
    \ defx#do_action('toggle_columns', 'mark:indent:icon:filename:type:size:time')
nnoremap <silent><buffer><expr> R
    \ defx#do_action('rename')

" Going to the mappings is kind of like going to the help screen
nnoremap <silent><buffer> <F1> :e ~/.config/nvim/ftplugin/defx.vim<CR>
nnoremap <silent><buffer> h :e ~/.config/nvim/ftplugin/defx.vim<CR>

" Make myself forget l and h mappings
nnoremap <silent><buffer> l <Nop>

" Turn on relative line numbers
set number relativenumber

" Turn on hybrid relative numbers (current line shows actual number not 0)
set number rnu

" Old mappings
" nnoremap <silent><buffer><expr> c
    " \ defx#do_action('copy')
" nnoremap <silent><buffer><expr> m
    " \ defx#do_action('move')
" nnoremap <silent><buffer><expr> p
    " \ defx#do_action('paste')
" nnoremap <silent><buffer><expr> E
    " \ defx#do_action('open', 'vsplit')
" nnoremap <silent><buffer><expr> P
    " \ defx#do_action('open', 'pedit')
" nnoremap <silent><buffer><expr> o
    " \ defx#do_action('open_or_close_tree')
" nnoremap <silent><buffer><expr> M
    " \ defx#do_action('new_multiple_files')
" nnoremap <silent><buffer><expr> !
    " \ defx#do_action('execute_command')
" nnoremap <silent><buffer><expr> ;
    " \ defx#do_action('repeat')
" nnoremap <silent><buffer><expr> ~
    " \ defx#do_action('cd')
" nnoremap <silent><buffer><expr> q
    " \ defx#do_action('quit')
" nnoremap <silent><buffer><expr> <Space>
    " \ defx#do_action('toggle_select') . 'j'
" nnoremap <silent><buffer><expr> *
    " \ defx#do_action('toggle_select_all')
" nnoremap <silent><buffer><expr> j
    " \ line('.') == line('$') ? 'gg' : 'j'
" nnoremap <silent><buffer><expr> k
    " \ line('.') == 1 ? 'G' : 'k'
" nnoremap <silent><buffer><expr> <C-g>
    " \ defx#do_action('print')
