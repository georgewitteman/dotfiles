#!/bin/sh

export PYENV_ROOT="${PYENV_ROOT:-"${HOME}/.pyenv"}"

if ! command -v pyenv >/dev/null 2>&1; then
  PATH="${PYENV_ROOT}/bin:${PATH}"
fi


eval "$(pyenv init - --path --no-rehash)"
