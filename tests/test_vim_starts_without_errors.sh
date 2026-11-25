#!/bin/sh

. "tests/setup.sh"

if ! command -v vim >/dev/null; then
  exit
fi

# Load every filetype with its own settings, so errors in those show up too.
# -es skips syntax highlighting, so turn it on. Vim takes at most 10 -c
# options, so chain the commands into one.
cmd="syntax on"
for f in "${HOME}"/.vim/after/ftplugin/*.vim; do
  cmd="${cmd} | set filetype=$(basename "$f" .vim)"
done

# -es: run without a terminal. Vim exits with 1 if anything reported an error,
# including the vendored plugins. :messages has the errors with where they
# happened, unlike v:errmsg, which also holds errors a plugin silenced.
# -u loads this vimrc, each -c runs a command after it, and qa! quits.
if ! messages="$(vim -es -u "${HOME}/.vim/vimrc" -c "$cmd" -c 'call writefile(split(execute("messages"), "\n"), "/dev/stdout")' -c 'qa!')"; then
  fail "vim reported an error:
${messages}"
fi
