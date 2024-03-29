#!/bin/sh

# https://github.com/chezmoi/dotfiles/blob/master/install.sh

set -o errexit

TAGARG=latest

while getopts "t:" arg; do
  case "${arg}" in
    t) TAGARG="${OPTARG}" ;;
    *) exit 1 ;;
  esac
done

echo "whoami: $(whoami)"

if command -v chezmoi >/dev/null 2>&1; then
  chezmoi=chezmoi
else
  bin_dir="${HOME}/.local/bin"
  chezmoi="${bin_dir}/chezmoi"

  # sh -s will read from stdin
  if command -v curl >/dev/null 2>&1; then
    curl --fail --silent --tlsv1.2 --show-error --location "https://get.chezmoi.io" | sh -s -- -b "$bin_dir" -t "$TAGARG"
  elif command -v wget >/dev/null 2>&1; then
    wget --quiet --output-document=- "https://get.chezmoi.io" | sh -s -- -b "$bin_dir" -t "$TAGARG"
  else
    echo "To install chezmoi, you must have curl or wget installed." >&2
    exit 1
  fi
fi

source_path="$("$chezmoi" source-path)"
if [ -d "$source_path" ]; then
  echo "warning: chezmoi already set up" >&2
  exit 1
fi

# POSIX way to get script's dir: https://stackoverflow.com/a/29834779/12156188
script_dir="$(cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P)"

# Print out the following commands before executing
set -o xtrace

# exec: replace current process with chezmoi init
exec "$chezmoi" init --apply "--source=${script_dir}"
