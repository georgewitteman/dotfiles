#!/bin/sh

. "tests/setup.sh"

PATH="${HOME}/.scripts:${PATH}"
dir="$(mktemp -d)"
mkdir -p "${dir}/node_modules/a" "${dir}/pkg/node_modules/b" "${dir}/empty"

if rmnm "${dir}/empty"; then
  fail "rmnm should fail when there's no node_modules"
fi

rmnm "$dir"
if [ -e "${dir}/node_modules" ] || [ ! -d "${dir}/pkg/node_modules" ]; then
  fail "rmnm should remove only ${dir}/node_modules"
fi

rmnm -r "$dir"
if [ -e "${dir}/pkg/node_modules" ]; then
  fail "rmnm -r should remove ${dir}/pkg/node_modules"
fi

rm -r "$dir"
