#!/bin/sh
# shellcheck disable=SC2310 # run only wraps env -i, so set -e being off in it doesn't matter

. "tests/setup.sh"

# stdin from /dev/null: bash reads ~/.bashrc even when it isn't interactive if
# its stdin is a network socket (it assumes sshd started it).
run() {
  env -i PATH="/usr/bin:/bin" HOME="$HOME" "$@" </dev/null
}

for sh in bash zsh; do
  if ! command -v "$sh" >/dev/null 2>&1; then
    continue
  fi

  if run "$sh" -c notarealcommand; then
    fail "expected invalid command to return non-zero exit code"
  fi

  # -i flag not passed
  if run "$sh" -c "echo-run true >/dev/null 2>&1"; then
    # shellcheck disable=SC2016 # $PATH should expand in the inner shell
    found="$(run "$sh" -c 'echo "echo-run=$(command -v echo-run) PATH=$PATH"')"
    fail "${sh} wasn't expecting to be able to run echo-run at this stage: ${found}"
  fi

  # -i flag passed
  if ! run "$sh" -ic "echo-run true >/dev/null 2>&1"; then
    # shellcheck disable=SC2016 # $PATH should expand in the inner shell
    found="$(run "$sh" -ic 'echo "PATH=$PATH"' 2>/dev/null)"
    fail "${sh} -i couldn't run echo-run: ${found}"
  fi
done
