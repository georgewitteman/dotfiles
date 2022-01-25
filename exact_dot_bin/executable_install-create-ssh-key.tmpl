#!/bin/sh

set -e

TYPE="ed25519"
FILE="${HOME}/.ssh/id_${TYPE}"

if [ ! -f "$FILE" ]; then
  echo "Creating new ssh key with ssh-keygen"
  # -N: passphrase
  # -t: type
  # -C: comment
  # -f: output file
  ssh-keygen -t "$TYPE" -C "{{ .email }}" -f "$FILE" -N ""
  echo "New SSH key created."
else
  echo "SSH key already exists."
fi

echo "Run 'cat ${FILE}.pub | pbcopy' to copy it to clipboard."
