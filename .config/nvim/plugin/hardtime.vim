" Run in every buffer
let g:hardtime_default_on = 1

let g:list_of_normal_keys = ["h", "j", "k", "l", "+", "<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
let g:list_of_visual_keys = ["h", "j", "k", "l", "+", "<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
let g:list_of_insert_keys = ["<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
let g:list_of_disabled_keys = []

" The quickfix window cannot be added to the ignore buffers array
let g:hardtime_ignore_quickfix = 1

" Maximum number of repetative key preses
let g:hardtime_maxcount = 2
