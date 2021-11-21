#!/bin/sh

if ! command -v rustup >/dev/null 2>&1; then
  rustup() {
    safe-eval 'curl --proto "=https" --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --no-modify-path'
  }
fi
