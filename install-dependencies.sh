#!/bin/sh

if command -v git >/dev/null 2>&1; then
  exit
fi

if ! command -v sudo >/dev/null 2>&1; then
  sudo() {
    "$@"
  }
fi

set -x

if command -v brew >/dev/null 2>&1; then
  brew install git
elif command -v apt-get >/dev/null 2>&1; then
  sudo apt-get install git
elif command -v apk >/dev/null 2>&1; then
  sudo apk add git
else
  echo "Don't know how to install git."
  exit 1
fi
