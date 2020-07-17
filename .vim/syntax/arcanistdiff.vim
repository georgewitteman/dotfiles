if has('spell')
  syntax spell toplevel
endif

" syntax match arcanistdiffHeading "^\(\u\S\+\s*\)\+:"
syntax match arcanistdiffHeading "^\(\u[^:\ \n\e\b\t\r]\+\s*\)\+:"
syntax match arcanistdiffComment "^#.*"

" The first line should only span one line.
syntax match arcanistdiffFirstLine   "\%^[^#].*" nextgroup=arcanistdiffBlank skipnl
syntax match arcanistdiffSimpleSummary   "^.\{0,50\}"
      \ contained containedin=arcanistdiffFirstLine
      \ nextgroup=arcanistdiffOverflow contains=@Spell

syntax match arcanistdiffOverflow    ".*" contained contains=@Spell
syntax match arcanistdiffBlank   "^[^#].*" contained contains=@Spell

hi def link arcanistdiffSimpleSummary Function
hi def link arcanistdiffBlank Error
hi def link arcanistdiffHeading Keyword
hi def link arcanistdiffComment Comment
