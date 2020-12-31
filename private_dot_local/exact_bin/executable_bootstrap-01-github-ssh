#!/bin/sh

set -e

if ! ssh-keygen -F github.com >/dev/null 2>&1; then
  # https://docs.github.com/en/github/authenticating-to-github/githubs-ssh-key-fingerprints
  expected_fingerprint="SHA256:nThbg6kXUpJWGl7E1IGOCspRomTxdCARLviKw6E5SY8"
  tmpfile="$(mktemp)"

  keygen_output="$(echo-eval "ssh-keyscan -t rsa github.com 2>/dev/null | tee $tmpfile | ssh-keygen -lf - | cut -d ' ' -f 2")"

  echo-info "Expected: $expected_fingerprint"
  echo-info "  Actual: $keygen_output"

  if [ "$expected_fingerprint" != "$keygen_output" ]; then
    echo-err "GitHub fingerprint check failed!"
    exit 1
  fi

  echo-ok "GitHub fingerprint check succeeded."
  echo-run mkdir -p "${HOME}/.ssh"
  echo-eval "cat $tmpfile >> $HOME/.ssh/known_hosts"
else
  echo-ok "github.com ssh key already in ~/.ssh/known_hosts"
fi
