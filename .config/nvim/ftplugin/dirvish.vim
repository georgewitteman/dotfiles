nnoremap <buffer> <silent> % :call dirvish_helpers#make_file()<CR>
nnoremap <buffer> <silent> <nowait> d :call dirvish_helpers#make_directory()<CR>
nnoremap <buffer> <silent> D :call dirvish_helpers#delete('d', 1)<CR>
nnoremap <buffer> <silent> gD :call dirvish_helpers#delete('rf', 1)<CR>
vnoremap <buffer> <silent> D :call dirvish_helpers#delete('d', 0)<CR>:execute 'Dirvish %'<CR>
vnoremap <buffer> <silent> gD :call dirvish_helpers#delete('rf', 0)<CR>:execute 'Dirvish %'<CR>
nnoremap <buffer> <silent> R :call dirvish_helpers#move_file()<CR>
