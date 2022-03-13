#!/bin/sh

# https://github.com/chezmoi/dotfiles/blob/master/install.sh

set -o errexit

if ! command -v chezmoi >/dev/null 2>&1; then
  bin_dir="${HOME}/.local/bin"
  chezmoi="${bin_dir}/chezmoi"
  if command -v curl >/dev/null 2>&1; then
    sh -c "$(curl -fsSL https://git.io/chezmoi)" -- -b "$bin_dir"
  elif command -v wget >/dev/null 2>&1; then
    sh -c "$(wget -qO- https://git.io/chezmoi)" -- -b "$bin_dir"
  else
    echo "To install chezmoi, you must have curl or wget installed." >&2
    exit 1
  fi
else
  chezmoi=chezmoi
fi

# POSIX way to get script's dir: https://stackoverflow.com/a/29834779/12156188
script_dir="$(cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P)"

# Print out the following commands before executing
set -o xtrace

# ls -lah "$HOME"
ls -lah "${HOME}/.pyenv" || true
wait
ls -lah "${HOME}/.nvm" || true
wait
git -C "${HOME}/.nvm" status || true
wait
git -C "${HOME}/.nvm" pull --verbose || true
wait
# git -C "${HOME}/.pyenv" status || true
# rm -rf "${HOME}/.pyenv"
# rm -rf "${HOME}/.nvm"

# exec: replace current process with chezmoi init
exec "$chezmoi" init --apply "--source=${script_dir}" --verbose --debug
