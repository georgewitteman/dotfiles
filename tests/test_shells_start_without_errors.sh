#!/bin/sh

. "tests/setup.sh"

for sh in bash zsh sh; do
  if ! command -v "$sh" >/dev/null 2>&1; then
    continue
  fi

  # Interactive, then interactive login (what terminals usually start). sh only
  # reads .shinit in a login shell, after .profile sets ENV.
  for flags in -ic -lic; do
    # Shells complain about job control when there's no terminal.
    errors="$(env -i PATH="/usr/bin:/bin" HOME="$HOME" "$sh" "$flags" true 2>&1 >/dev/null </dev/null |
      grep -v -e 'no job control in this shell' -e 'cannot set terminal process group' -e 'job control turned off' || true)"
    if [ -n "$errors" ]; then
      fail "${sh} ${flags} printed errors: ${errors}"
    fi
  done
done
