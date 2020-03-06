let test#javascript#runner = 'jest'

setlocal path+=node_modules,..
setlocal isfname+=@-@

compiler jest

let undo_ftplugin = 'setlocal path< isfname<'
