" Indent git config files with tabs (noexpandtab), as git writes them.
" setlocal changes the options only for this buffer, and shiftwidth=8 makes
" each indent one tab, since tabs are 8 columns wide.
setlocal noexpandtab
setlocal shiftwidth=8

" b:undo_ftplugin holds the commands Vim runs to undo this file's settings
" when the buffer's filetype changes. This adds to any already there, joined
" with |. expandtab< and shiftwidth< reset the options to their global values.
let b:undo_ftplugin = (exists('b:undo_ftplugin') ? b:undo_ftplugin . '|' : '') . 'setlocal expandtab< shiftwidth<'
