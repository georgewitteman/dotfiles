setlocal comments=:# commentstring=#\ %s
setlocal nomodeline tabstop=8 formatoptions+=tl textwidth=72
setlocal formatoptions-=c formatoptions-=r formatoptions-=o formatoptions-=q formatoptions+=n
setlocal formatlistpat+=\\\|^\\s*[-*+]\\s\\+

let b:undo_ftplugin = 'setlocal modeline< tabstop< formatoptions< tw< com< cms< formatlistpat<'
