#!/bin/sh

set -e

TYPE="ed25519"
FILE="${HOME}/.ssh/id_${TYPE}"

if [ ! -f "$FILE" ]; then
  # -N: passphrase
  # -t: type
  # -C: comment
  # -f: output file
  echo-run ssh-keygen -t "$TYPE" -C "{{ .email }}" -f "$FILE" -N ""
  echo-ok "New SSH key created."
else
  echo-ok "SSH key already exists."
fi

echo-ok "Run 'cat ${FILE}.pub | pbcopy' to copy it to clipboard."
