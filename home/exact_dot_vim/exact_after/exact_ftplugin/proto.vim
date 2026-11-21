setlocal shiftwidth=4
setlocal softtabstop=4
let b:undo_ftplugin = (exists('b:undo_ftplugin') ? b:undo_ftplugin . '|' : '') . 'setlocal shiftwidth< softtabstop<'
