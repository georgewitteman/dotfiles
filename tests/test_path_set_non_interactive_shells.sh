#!/bin/sh

. "tests/setup.sh"

run() {
  env -i PATH="/usr/bin:/bin" HOME="$HOME" "$@"
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
    fail "wasn't expecting to be able to run echo-run at this stage"
  fi

  # -i flag passed
  run "$sh" -ic "echo-run true >/dev/null 2>&1"
done
