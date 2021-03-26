#!/bin/sh

export PYENV_ROOT="${HOME}/.local/share/pyenv"

if [ -f "${PYENV_ROOT}/version" ]; then
  while IFS= read -r line || [ -n "$line" ]; do
    PYENV_PATH="${PYENV_PATH:+${PYENV_PATH}:}${PYENV_ROOT}/versions/${line}/bin"
  done <"${PYENV_ROOT}/version"
fi

# Reverse the path so that the first version in the file is first in $PATH
PATH="${PYENV_PATH:+${PYENV_PATH}:}${PYENV_ROOT}/bin:${PATH}"
unset PYENV_PATH

if [ -n "$VIRTUAL_ENV" ]; then
  # shellcheck disable=SC1090
  . "${VIRTUAL_ENV}/bin/activate"
fi
