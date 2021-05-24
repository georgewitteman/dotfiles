#!/bin/sh

set -e

if ! command -v op >/dev/null 2>&1; then
  brew install --cask 1password-cli
fi
