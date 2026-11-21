setlocal path+=node_modules,..
setlocal isfname+=@-@

let b:undo_ftplugin = (exists('b:undo_ftplugin') ? b:undo_ftplugin . '|' : '') . 'setlocal path< isfname<'
