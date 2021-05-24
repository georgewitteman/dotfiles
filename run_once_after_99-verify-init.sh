#!/bin/sh

exit
set -e

. "${HOME}/.profile"

echo-info "Running tests"

assert_file_exists() {
  if [ -f "$1" ]; then
    echo-ok "The file '$1' exists"
  else
    echo-err "The file '$1' does not exist"
    exit 1
  fi
}

assert_cmd_exists() {
  if command -v "$1" >/dev/null 2>&1; then
    echo-ok "The command '$1' exists in \$PATH"
  else
    echo-err "The command '$1' is not in \$PATH"
    exit 1
  fi
}

assert_exit_0() {
  if eval "$1"; then
    echo-ok "The file '$1' succeeded"
  else
    echo-err "The command '$1' failed"
    exit 1
  fi
}

assert_file_exists "${HOME}/.zshrc"

assert_cmd_exists rg
assert_cmd_exists op
assert_cmd_exists jq

assert_exit_0 "nvim -v | grep -q NVIM"

echo-ok "All tests ran successfully"
