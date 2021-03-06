#!/bin/sh

pyenv() {
  if ! command -v pyenv >/dev/null 2>&1 && [ ! -d "$PYENV_ROOT" ]; then
    pyenv-reinstall || return "$?"
  fi

  command pyenv "$@" || return "$?"

  PATH="$(remove_from_path "$PYENV_ROOT")"

  if [ -f "${PYENV_ROOT}/version" ]; then
    while IFS= read -r line || [ -n "$line" ]; do
      PYENV_PATH="${PYENV_PATH:+${PYENV_PATH}:}${PYENV_ROOT}/versions/${line}/bin"
    done <"${PYENV_ROOT}/version"
  fi

  # Reverse the path so that the first version in the file is first in $PATH
  PATH="${PYENV_PATH:+${PYENV_PATH}:}${PYENV_ROOT}/bin:${PATH}"
  unset PYENV_PATH

  if [ -n "$VIRTUAL_ENV" ]; then
    # shellcheck disable=SC1090,SC1091
    . "${VIRTUAL_ENV}/bin/activate"
  fi
}
