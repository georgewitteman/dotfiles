#!/bin/sh

set -o nounset
set -o errexit
set -o xtrace

if [ -f ~/.zcompdump ]; then
  rm ~/.zcompdump
fi
