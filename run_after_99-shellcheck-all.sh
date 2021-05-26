#!/bin/sh

set -e

. "${HOME}/.profile"

if [ -n "$GITHUB_WORKFLOW" ]; then
  echo "::group::Running shellcheck"
fi

if ! command -v shellcheck >/dev/null 2>&1; then
  echo-ok "Skipping shellcheck since it's not installed"
  exit
fi

shellcheck-all

echo-ok "Shellcheck ran successfully"

if [ -n "$GITHUB_WORKFLOW" ]; then
  echo "::endgroup::"
fi
