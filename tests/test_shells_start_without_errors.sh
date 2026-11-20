#!/bin/sh

. "tests/setup.sh"

for sh in bash zsh; do
  if ! command -v "$sh" >/dev/null 2>&1; then
    continue
  fi

  # Interactive, then interactive login (what terminals usually start)
  for flags in -ic -lic; do
    # Bash complains about job control when there's no terminal.
    errors="$(env -i PATH="/usr/bin:/bin" HOME="$HOME" "$sh" "$flags" true 2>&1 >/dev/null </dev/null |
      grep -v -e 'no job control in this shell' -e 'cannot set terminal process group' || true)"
    if [ -n "$errors" ]; then
      fail "${sh} ${flags} printed errors: ${errors}"
    fi
  done
done
