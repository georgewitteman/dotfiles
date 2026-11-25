#!/bin/sh

. "tests/setup.sh"

# Interactive, and interactive login (what terminals usually start). sh only
# reads .shinit in a login shell, after .profile sets ENV.
for shell_and_flags in "bash -ic" "bash -lic" "zsh -ic" "zsh -lic" "sh -lic"; do
  sh="${shell_and_flags% *}"
  flags="${shell_and_flags#* }"
  if ! command -v "$sh" >/dev/null; then
    continue
  fi

  if ! output="$(env -i PATH="/usr/bin:/bin" HOME="$HOME" "$sh" "$flags" true 2>&1 >/dev/null </dev/null)"; then
    fail "${sh} ${flags} exited with an error: ${output}"
  fi
  # Shells complain about job control when there's no terminal.
  errors="$(echo "$output" | grep -v -e 'no job control in this shell' -e 'cannot set terminal process group' -e 'job control turned off' || true)"
  if [ -n "$errors" ]; then
    fail "${sh} ${flags} printed errors: ${errors}"
  fi
done
