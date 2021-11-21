#!/bin/sh

export NVM_DIR="${NVM_DIR:-"${HOME}/.nvm"}"

if [ -f "${NVM_DIR}/alias/default" ]; then
  read -r line < "${NVM_DIR}/alias/default"

  for node_bin in "${NVM_DIR}/versions/node/v${line}"*"/bin"; do
    [ -d "$node_bin" ] || continue
    PATH="${node_bin}:${PATH}"
    break
  done >/dev/null 2>&1

  unset line
  unset node_bin
fi
