#!/bin/sh

pyenv() {
  command pyenv "$@" || return "$?"

  while true; do
    case ":$PATH" in
      *:"$PYENV_ROOT"/*:*) PATH="${PATH%%${PYENV_ROOT}*}${PATH#*${PYENV_ROOT}*:}" ;;
      *"$PYENV_ROOT"/*) PATH="${PATH%%${PYENV_ROOT}*}" ;;
      *)
        PATH="${PATH%:}"
        break
        ;;
    esac
  done

  while IFS= read -r line || [ -n "$line" ]; do
    PYENV_PATH="${PYENV_PATH:+${PYENV_PATH}:}${PYENV_ROOT}/versions/${line}/bin"
  done <"${PYENV_ROOT}/version"

  # Reverse the path so that the first version in the file is first in $PATH
  PATH="${PYENV_PATH:+${PYENV_PATH}:}${PYENV_ROOT}/bin:${PATH}"
  unset PYENV_PATH

  if [ -n "$VIRTUAL_ENV" ]; then
    . "${VIRTUAL_ENV}/bin/activate"
  fi
}
