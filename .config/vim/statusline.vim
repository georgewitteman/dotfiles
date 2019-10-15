hi StatusLine guifg=#ABB2BF guibg=#3E4452
hi StatusLineNC guibg=#6E7A91 guifg=#353A46

" Always display the status line
set laststatus=2

set statusline=[%n]\ %<%.99f
set statusline+=\ %{exists('*FugitiveStatusline')?FugitiveStatusline():''}
set statusline+=%y%h%w%m%r
set statusline+=%{exists('*CapsLockStatusline')?CapsLockStatusline():''}
set statusline+=%=\ %(%l,%c%V%)\ %P
