#!/bin/sh

nvm() {
  if [ ! -d "$NVM_DIR" ]; then
    nvm_upgrade
  fi
  unset -f nvm
  . "$NVM_DIR/nvm.sh" --no-use
  nvm "$@"
}

nvm_upgrade() {
  if [ ! -d "$NVM_DIR" ]; then
    echo_run git clone "git@github.com:nvm-sh/nvm.git" "$NVM_DIR"
  else
    echo_run git -C "$NVM_DIR" fetch
  fi
  echo_run git -C "$NVM_DIR" checkout \
    "$(git -C "$NVM_DIR" describe --abbrev=0 --tags --match "v[0-9]*" \
    "$(git -C "$NVM_DIR" rev-list --tags --max-count=1)")"
}
