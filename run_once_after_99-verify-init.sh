#!/bin/sh

assert_exists() {
  if [ ! -e "$1" ]; then
    echo-ok "The file '$1' does exists"
  else
    echo-err "The file '$1' does not exist"
    exit 1
  fi
}

assert_cmd_exists() {
  if command -v "$1" >/dev/null 2>&1; then
    echo-ok "The command '$1' is not in \$PATH"
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

assert_exists "${HOME}/.ssh"
assert_exists ${HOME}/*.pub
assert_exit_0 "grep -q github.com ~/.ssh/known_hosts"

assert_cmd_exists rg
assert_cmd_exists op
assert_cmd_exists jq

assert_exit_0 "nvim -v | grep -q NVIM"
