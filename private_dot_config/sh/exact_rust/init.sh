#!/bin/sh

if ! command -v rustup; then
  echo_eval 'curl --proto "=https" --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --no-modify-path'
fi
