export PYENV_ROOT="${PYENV_ROOT:-"${HOME}/.pyenv"}"

if [ -n "$PYENV_VERSION" ] && [ -d "${PYENV_ROOT}/versions/${PYENV_VERSION}" ]; then
  PYENV_PATH="${PYENV_PATH:+${PYENV_PATH}:}${PYENV_ROOT}/versions/${PYENV_VERSION}/bin"
elif [ -f "${PWD}/.python-version" ]; then
  while IFS= read -r line || [ -n "$line" ]; do
    PYENV_PATH="${PYENV_PATH:+${PYENV_PATH}:}${PYENV_ROOT}/versions/${line}/bin"
  done <"${PWD}/.python-version"
elif [ -f "${PYENV_ROOT}/version" ]; then
  while IFS= read -r line || [ -n "$line" ]; do
    PYENV_PATH="${PYENV_PATH:+${PYENV_PATH}:}${PYENV_ROOT}/versions/${line}/bin"
  done <"${PYENV_ROOT}/version"
fi

# Reverse the path so that the first version in the file is first in $PATH
PATH="${PYENV_PATH:+${PYENV_PATH}:}${PYENV_ROOT}/bin:${PATH}"
unset PYENV_PATH

if [ -n "$VIRTUAL_ENV" ]; then
  # shellcheck source=/dev/null
  . "${VIRTUAL_ENV}/bin/activate"
fi
