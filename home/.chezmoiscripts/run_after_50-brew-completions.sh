#!/bin/sh

set -o errexit

if command -v brew >/dev/null 2>&1; then
  brew_prefix="$(brew --prefix)"
  # -O: True if file exists and its owner matches the effective user id of this
  # process.
  if [ -O "$brew_prefix" ]; then
    brew completions link
  fi
fi
