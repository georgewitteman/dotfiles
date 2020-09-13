#!/bin/sh

if [ -t 1 ]; then
  printf "\033[1;34m" >&2
fi
printf '$ %s\n' "$*" >&2
if [ -t 1 ]; then
  printf "\033[0m" >&2
fi

eval "$@"
