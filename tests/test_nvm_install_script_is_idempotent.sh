#!/bin/sh

. "tests/setup.sh"

if ! command -v bash >/dev/null 2>&1; then
  exit 0
fi

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash

set -o xtrace
chezmoi --exclude scripts diff || true
chezmoi --exclude scripts verify
