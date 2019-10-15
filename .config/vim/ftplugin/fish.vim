setlocal shiftwidth=4
setlocal softtabstop=4
setlocal shiftwidth=4

command LintFix silent execute '!fish_indent -w %:p' | silent redraw!
