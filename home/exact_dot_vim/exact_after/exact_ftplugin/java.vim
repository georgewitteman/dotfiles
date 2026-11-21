setlocal tabstop=4
setlocal shiftwidth=4
setlocal expandtab

let b:undo_ftplugin = (exists('b:undo_ftplugin') ? b:undo_ftplugin . '|' : '') . 'setlocal expandtab< tabstop< shiftwidth<'
