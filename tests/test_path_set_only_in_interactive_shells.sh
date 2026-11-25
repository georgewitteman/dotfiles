#!/bin/sh
# run only wraps env -i, so set -e being off in it doesn't matter.
# shellcheck disable=SC2310

. "tests/setup.sh"

# env -i starts the shell with an empty environment, apart from the variables
# listed. stdin from /dev/null: bash reads ~/.bashrc even when it isn't
# interactive if its stdin is a network socket (it assumes sshd started it).
run() {
  env -i PATH="/usr/bin:/bin" HOME="$HOME" "$@" </dev/null
}

for sh in bash zsh; do
  if ! command -v "$sh" >/dev/null; then
    continue
  fi

  # -i flag not passed
  if run "$sh" -c "echo-run true >/dev/null 2>&1"; then
    # $PATH should expand in the inner shell.
    # shellcheck disable=SC2016
    found="$(run "$sh" -c 'echo "echo-run=$(command -v echo-run) PATH=$PATH"')"
    fail "${sh} wasn't expecting to be able to run echo-run at this stage: ${found}"
  fi

  # -i flag passed
  if ! run "$sh" -ic "echo-run true >/dev/null 2>&1"; then
    # $PATH should expand in the inner shell.
    # shellcheck disable=SC2016
    found="$(run "$sh" -ic 'echo "PATH=$PATH"' 2>/dev/null)"
    fail "${sh} -i couldn't run echo-run: ${found}"
  fi
done
