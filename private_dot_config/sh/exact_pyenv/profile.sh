#!/bin/sh

export PYENV_ROOT="${HOME}/.local/share/pyenv"

if [ -d "$PYENV_ROOT" ]; then
  while IFS= read -r line || [ -n "$line" ]; do
    PYENV_PATH="${PYENV_PATH:+${PYENV_PATH}:}${PYENV_ROOT}/versions/${line}/bin"
  done <"${PYENV_ROOT}/version"

  # Reverse the path so that the first version in the file is first in $PATH
  PATH="${PYENV_PATH:+${PYENV_PATH}:}${PYENV_ROOT}/bin:${PATH}"
  unset PYENV_PATH
fi
