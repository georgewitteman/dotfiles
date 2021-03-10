#!/bin/sh

nvm() {
  unset -f nvm
  . "$NVM_DIR/nvm.sh" --no-use
  nvm "$@"
}
