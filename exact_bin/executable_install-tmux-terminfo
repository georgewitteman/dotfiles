#!/bin/sh

set -e

. "${HOME}/.profile"

if command -v tmux >/dev/null 2>&1; then
  echo-info "Installing tmux terminfo file"
  echo-run tic -x "${HOME}/.config/tmux/tmux.terminfo"
else
  echo-ok "tmux not installed."
fi
