#!/bin/sh

set -o errexit
set -o xtrace

if command -v brew >/dev/null 2>&1; then
  brew completions link
fi
