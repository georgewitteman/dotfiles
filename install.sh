#!/bin/sh

# https://github.com/chezmoi/dotfiles/blob/master/install.sh

set -o errexit
set -o nounset

TAGARG=latest

while getopts "t:" arg; do
  case "${arg}" in
    t) TAGARG="${OPTARG}" ;;
    *) exit 1 ;;
  esac
done

if command -v chezmoi >/dev/null 2>&1; then
  chezmoi=chezmoi
else
  bin_dir="${HOME}/.local/bin"
  chezmoi="${bin_dir}/chezmoi"

  # Download the installer before running it, so a failed download stops here
  # instead of running an empty script.
  if command -v curl >/dev/null 2>&1; then
    installer="$(curl --fail --silent --tlsv1.2 --show-error --location "https://get.chezmoi.io")"
  elif command -v wget >/dev/null 2>&1; then
    installer="$(wget --quiet --output-document=- "https://get.chezmoi.io")"
  else
    echo "To install chezmoi, you must have curl or wget installed." >&2
    exit 1
  fi
  sh -c "$installer" -- -b "$bin_dir" -t "$TAGARG"
fi

source_path="$("$chezmoi" source-path)"
if [ -d "$source_path" ]; then
  echo "error: chezmoi already set up" >&2
  exit 1
fi

script_dir="$(cd -P -- "$(dirname -- "$0")" && pwd -P)"

# While a codespace is being created its disk is busy, so each fsync is slow,
# and chezmoi fsyncs every file it writes and every update to its state
# database. So write files in place (--safe=false), and keep the state
# database in memory until the end.
tmp_dir=""
set --
if [ -d /dev/shm ] && [ -w /dev/shm ]; then
  tmp_dir="$(mktemp -d /dev/shm/chezmoi.XXXXXX)"
  set -- "--persistent-state=${tmp_dir}/chezmoistate.boltdb"
fi

# Print out the following commands before executing
set -o xtrace

"$chezmoi" init --apply --safe=false "$@" "--source=${script_dir}"

if [ -n "$tmp_dir" ]; then
  # chezmoi keeps its state database next to its config file.
  config_file="$("$chezmoi" execute-template "$@" '{{ .chezmoi.configFile }}')"
  mv "${tmp_dir}/chezmoistate.boltdb" "$(dirname "$config_file")/"
  rmdir "$tmp_dir"
fi

# Make zsh the login shell in codespaces, so SSH sessions and $SHELL use it too
if [ -n "${CODESPACES-}" ] && command -v zsh >/dev/null 2>&1 && command -v chsh >/dev/null 2>&1; then
  sudo -n chsh "$(id -un)" --shell "$(command -v zsh)" || true
fi
