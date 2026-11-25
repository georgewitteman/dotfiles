#!/bin/sh

# Stop at the first command that fails, or that uses a variable that isn't
# set.
set -o errexit
set -o nounset

TAGARG=latest

# getopts reads the short options one at a time. "t:" means -t is the only
# one, and takes a value, which getopts puts in OPTARG.
while getopts "t:" arg; do
  case "${arg}" in
    t) TAGARG="${OPTARG}" ;;
    *) exit 1 ;;
  esac
done

if command -v chezmoi >/dev/null; then
  chezmoi=chezmoi
else
  bin_dir="${HOME}/.local/bin"
  chezmoi="${bin_dir}/chezmoi"

  # Download the installer before running it, so a failed download stops here
  # instead of running an empty script. curl --fail fails on an HTTP error,
  # --silent hides the progress bar but --show-error still shows errors, and
  # --location follows redirects. wget --output-document=- prints the file
  # instead of saving it.
  if command -v curl >/dev/null; then
    installer="$(curl --fail --silent --show-error --location "https://get.chezmoi.io")"
  elif command -v wget >/dev/null; then
    installer="$(wget --quiet --output-document=- "https://get.chezmoi.io")"
  else
    echo "error: curl or wget is needed to install chezmoi" >&2
    exit 1
  fi
  # sh -c runs the installer. The word after it (--) becomes the installer's
  # $0, and the rest its arguments: -b to install into bin_dir, and -t for
  # the version.
  sh -c "$installer" -- -b "$bin_dir" -t "$TAGARG"
fi

# chezmoi source-path prints where chezmoi keeps its source, which exists once
# it's set up.
source_path="$("$chezmoi" source-path)"
if [ -d "$source_path" ]; then
  echo "error: chezmoi already set up" >&2
  exit 1
fi

# The directory this script is in, as a full path. dirname drops the file
# name from $0, the path the script was run as. -- stops cd and dirname from
# reading a path that starts with - as an option.
script_dir="$(cd -- "$(dirname -- "$0")" && pwd)"

# While a codespace is being created its disk is busy, so each fsync is slow,
# and chezmoi fsyncs every update to its state database. So keep that database
# in memory until the end. /dev/shm is a directory kept in memory on Linux.
# set -- empties the script's arguments, and then holds the extra chezmoi
# option when there is one, which "$@" passes along.
tmp_dir=""
set --
if [ -d /dev/shm ] && [ -w /dev/shm ]; then
  tmp_dir="$(mktemp -d /dev/shm/chezmoi.XXXXXX)"
  set -- "--persistent-state=${tmp_dir}/chezmoistate.boltdb"
fi

# Print out the following commands before executing.
set -o xtrace

# chezmoi init sets chezmoi up with this repo as its source (--source), and
# --apply writes the files. --safe=false writes each file in place, instead of
# to a new file that replaces it, which saves an fsync per file while a
# codespace's disk is busy.
"$chezmoi" init --apply --safe=false "$@" "--source=${script_dir}"

if [ -n "$tmp_dir" ]; then
  # chezmoi keeps its state database next to its config file. execute-template
  # fills in a template, here the config file's path.
  config_file="$("$chezmoi" execute-template "$@" '{{ .chezmoi.configFile }}')"
  mv "${tmp_dir}/chezmoistate.boltdb" "$(dirname "$config_file")/"
  rmdir "$tmp_dir"
fi

# Make zsh the login shell in codespaces, so SSH sessions and $SHELL use it too.
# chsh changes the login shell of the current user (id -un). sudo -n fails
# instead of asking for a password. ${CODESPACES-} is empty when CODESPACES
# isn't set, instead of an error under nounset.
if [ -n "${CODESPACES-}" ] && command -v zsh >/dev/null && command -v chsh >/dev/null; then
  sudo -n chsh "$(id -un)" --shell "$(command -v zsh)" || true
fi

# Stop the codespace image's system zshrc and bashrc from loading nvm, which
# slows down every new shell. They only load nvm.sh when it exists, so rename
# it. Leave it when nvm has installed a Node version, since then it's in use.
# -f checks that nvm.sh is a file, and ls -A lists everything in versions
# except . and .., so it prints nothing when there are no versions.
nvm_dir=/usr/local/share/nvm
if [ -n "${CODESPACES-}" ] && [ -f "${nvm_dir}/nvm.sh" ] && [ -z "$(ls -A "${nvm_dir}/versions" 2>/dev/null || true)" ]; then
  mv "${nvm_dir}/nvm.sh" "${nvm_dir}/nvm.sh.disabled" || true
fi
