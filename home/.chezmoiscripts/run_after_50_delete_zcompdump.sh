#!/bin/sh

set -o nounset
set -o errexit

if [ -f ~/.zcompdump ]; then
  rm ~/.zcompdump
fi
