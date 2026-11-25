#!/bin/sh

. "tests/setup.sh"

# Interactive, and interactive login (what terminals usually start). sh only
# reads .shinit in a login shell, after .profile sets ENV.
# -i makes the shell interactive, -l a login shell, and -c runs the command
# after the flags. ${...% *} is the part before the space, and ${...#* } the
# part after it.
for shell_and_flags in "bash -ic" "bash -lic" "zsh -ic" "zsh -lic" "sh -lic"; do
  sh="${shell_and_flags% *}"
  flags="${shell_and_flags#* }"
  if ! command -v "$sh" >/dev/null; then
    continue
  fi

  # env -i starts the shell with an empty environment, apart from the
  # variables listed. 2>&1 >/dev/null keeps only stderr: it goes where stdout
  # was going, into $output, and then stdout is thrown away.
  if ! output="$(env -i PATH="/usr/bin:/bin" HOME="$HOME" "$sh" "$flags" true 2>&1 >/dev/null </dev/null)"; then
    fail "${sh} ${flags} exited with an error: ${output}"
  fi
  # Shells complain about job control when there's no terminal. grep -v
  # drops the lines that match any of the -e patterns.
  errors="$(echo "$output" | grep -v -e 'no job control in this shell' -e 'cannot set terminal process group' -e 'job control turned off' || true)"
  if [ -n "$errors" ]; then
    fail "${sh} ${flags} printed errors: ${errors}"
  fi
done
