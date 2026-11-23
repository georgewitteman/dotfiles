#!/bin/sh

. "tests/setup.sh"

if ! command -v vim >/dev/null 2>&1; then
  exit
fi

# -es: run without a terminal. Vim exits with 1 if anything reported an error,
# including the vendored plugins. -es skips syntax highlighting, so turn it on
# and load chezmoi.vim's template syntax, which sources files of its own.
if ! error="$(vim -es -N -u "${HOME}/.vim/vimrc" -c 'syntax on' -c 'set filetype=chezmoitmpl' -c 'call writefile([v:errmsg], "/dev/stdout")' -c 'qa!')"; then
  fail "vim reported an error. The last one was: ${error}"
fi
