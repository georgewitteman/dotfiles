#!/bin/sh

set -e

. "${HOME}/.profile"

if ! command -v vim >/dev/null 2>&1; then
  echo "Skipping vim plugins install because vim is not installed"
  exit
fi

if [ -n "$GITHUB_WORKFLOW" ]; then
  echo "::group::Installing vim plugins"
fi

echo-run vim -i NONE -c "PlugInstall" -c "qa"

if [ -n "$GITHUB_WORKFLOW" ]; then
  echo "::endgroup::"
fi
