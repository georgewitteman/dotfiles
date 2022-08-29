#!/bin/sh

set -o errexit

if ! sudo --validate --non-interactive >/dev/null 2>&1; then
  echo "skipping dev container setup that requires sudo" >&2
  exit
fi

if command -v curl >/dev/null 2>&1; then
  if ! command -v starship >/dev/null 2>&1; then
    curl -sS https://starship.rs/install.sh | sh -s -- --yes --verbose
  fi
else
  echo "skipping starship install (no curl)" >&2
fi

if command -v apt-get >/dev/null 2>&1; then
  sudo apt-get update
  DEBIAN_FRONTEND=noninteractive sudo apt-get install --yes \
    dnsutils \
    fd-find \
    fzf \
    iputils-ping \
    neovim \
    ripgrep \
    telnet \
    universal-ctags \
    vim-nox \
    zsh
else
  echo "skipping fzf install (no apt-get)" >&2
fi
