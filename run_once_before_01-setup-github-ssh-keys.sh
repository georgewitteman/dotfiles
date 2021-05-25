#!/bin/sh

if [ -n "$GITHUB_WORKFLOW" ]; then
  echo "::group::Setup GitHub SSH keys"
fi

set -e

if ! ssh-keygen -F github.com >/dev/null 2>&1; then
  # https://docs.github.com/en/github/authenticating-to-github/githubs-ssh-key-fingerprints
  expected_fingerprint="SHA256:nThbg6kXUpJWGl7E1IGOCspRomTxdCARLviKw6E5SY8"
  tmpfile="$(mktemp)"

  keygen_output="$(ssh-keyscan -t rsa github.com 2>/dev/null | tee $tmpfile | ssh-keygen -lf - | cut -d ' ' -f 2)"

  echo "Expected: $expected_fingerprint"
  echo "  Actual: $keygen_output"

  if [ "$expected_fingerprint" != "$keygen_output" ]; then
    echo "GitHub fingerprint check failed!"
    exit 1
  fi

  echo "GitHub fingerprint check succeeded."
  mkdir -p "${HOME}/.ssh"
  cat "$tmpfile" >> $HOME/.ssh/known_hosts
else
  echo "github.com ssh key already in ~/.ssh/known_hosts"
fi

if [ -n "$GITHUB_WORKFLOW" ]; then
  echo "::endgroup::"
fi
