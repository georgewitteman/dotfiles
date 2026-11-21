" Don't hide characters. It's more annoying than it is pretty.
setlocal conceallevel=0

let g:pencil#conceallevel = 0

let b:undo_ftplugin = (exists('b:undo_ftplugin') ? b:undo_ftplugin . '|' : '') . 'setlocal conceallevel<'
