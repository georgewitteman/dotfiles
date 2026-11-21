setlocal noexpandtab
setlocal nosmarttab
setlocal softtabstop=8
setlocal shiftwidth=8

let b:undo_ftplugin = (exists('b:undo_ftplugin') ? b:undo_ftplugin . '|' : '') . 'setlocal expandtab< smarttab< softtabstop< shiftwidth<'
