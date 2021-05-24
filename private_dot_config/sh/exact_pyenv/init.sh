#!/bin/sh

if [ ! -d "${PYENV_ROOT}/cache" ]; then
  echo-run mkdir -p "${PYENV_ROOT}/cache"
fi

if ! command -v pyenv >/dev/null 2>&1 && [ ! -d "$PYENV_ROOT" ]; then
  pyenv-reinstall
fi

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
}
