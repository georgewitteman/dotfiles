#!/bin/sh

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash

set -o xtrace
chezmoi --exclude scripts diff || true
chezmoi --exclude scripts verify
