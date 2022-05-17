#!/bin/sh

# Lazy loads nvm
nvm() {
  unset -f nvm
  # shellcheck source=/dev/null disable=SC2240
  . "$NVM_DIR/nvm.sh" --no-use
  nvm "$@"
}
