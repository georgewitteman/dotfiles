#!/bin/sh

export PYENV_ROOT="${HOME}/.local/share/yavm/pyenv"

PATH="${PYENV_ROOT}/bin:${PATH}"

while IFS= read -r line || [ -n "$line" ]; do
  PATH="${PYENV_ROOT}/versions/${line}/bin:${PATH}"
done <"${PYENV_ROOT}/version"
