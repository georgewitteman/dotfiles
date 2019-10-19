" Reset all highlight groups added by the user
highlight clear

if exists("syntax_on")
  " Put the colors back to default ones, but
  " doesn't change color for highlight options
  syntax reset
endif

set background=dark
let colors_name = 'basic'

function! s:X(group, ...)
  let histring = 'hi ' . a:group . ' '

  if a:0 >= 1 && strlen(a:1)
    let histring .= 'ctermfg=' . a:1 . ' '
  else
    let histring .= 'ctermfg=NONE '
  endif

  if a:0 >= 2 && strlen(a:2)
    let histring .= 'ctermbg=' . a:2 . ' '
  else
    let histring .= 'ctermbg=NONE '
  endif

  if a:0 >= 3 && strlen(a:3)
    let histring .= 'cterm=' . a:3 . ' '
  else
    let histring .= 'cterm=NONE '
  endif

  let histring .= 'guibg=NONE guifg=NONE gui=NONE'
  execute histring
endfunction

call s:X('Comment', 'darkgray', 'NONE', 'italic')
call s:X('Constant', 'green')
call s:X('String', 2)
call s:X('Number', 'yellow')
call s:X('Boolean', 'yellow')
call s:X('Identifier', 'red')
call s:X('Function', 4)
call s:X('Statement', 'magenta')
call s:X('PreProc', 'yellow')
call s:X('Type', 'yellow')
call s:X('Special', 'blue')
call s:X('Operator', 'blue')
call s:X('Keyword', 'red')
call s:X('Include', 'blue')
call s:X('SpecialComment', 'darkgray')
call s:X('Error', 'red', 'NONE')
call s:X('Todo', 'magenta')

call s:X('LineNr', 8)
highlight CursorLineNr ctermfg=white guifg=NONE guibg=#2c323c
call s:X('Comment', 8)
call s:X('ColorColumn', 7, 8)
call s:X('Folded', 7, 8)
call s:X('FoldColumn', 7, 8)
call s:X('Pmenu', 15, 8)
call s:X('PmenuSel', 8, 15)
call s:X('SpellCap', 7, 8)
call s:X('StatusLine', 15, 8, 'bold')
call s:X('StatusLineNC', 7, 8)
call s:X('VertSplit', 8, 8)
call s:X('SignColumn', 8)
call s:X('MatchParen', 'NONE', 'NONE', 'bold,underline')
highlight CursorLine cterm=NONE ctermbg=16 guibg=#2c323c

call s:X('Search', 0, 11)
call s:X('Visual', 'NONE', 'NONE', 'inverse')

set fillchars+=vert:│
