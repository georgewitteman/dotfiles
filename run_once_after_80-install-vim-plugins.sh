#!/bin/sh

set -e

. "${HOME}/.profile"

if [ -n "$GITHUB_WORKFLOW" ]; then
  echo "::group::Installing vim plugins"
fi

update-50-vim

if [ -n "$GITHUB_WORKFLOW" ]; then
  echo "::endgroup::"
fi
