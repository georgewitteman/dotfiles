#!/bin/sh

. "tests/setup.sh"

PATH="${HOME}/.scripts:${PATH}"
dir="$(mktemp -d)"
mkdir -p "${dir}/node_modules/a" "${dir}/pkg/node_modules/b" "${dir}/empty"

if rmnm "${dir}/empty"; then
  fail "rmnm should fail when there's no node_modules"
fi

rmnm "$dir"
if [ -e "${dir}/node_modules" ] || [ -e "${dir}/pkg/node_modules" ]; then
  fail "rmnm should remove ${dir}/node_modules and ${dir}/pkg/node_modules"
fi

# The trash is deleted in the background, so give it a few seconds.
for _ in 1 2 3 4 5 6 7 8 9 10; do
  set -- "$dir"/.rmnm.*
  if [ ! -e "$1" ]; then
    rm -r "$dir"
    exit
  fi
  sleep 0.5
done
fail "rmnm left its trash behind in ${dir}"
