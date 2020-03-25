augroup AutoResizeQuickfix
  autocmd!
  autocmd! FileType qf call qfautoresize#auto_resize_window(3, 20)
augroup END
