#!/bin/sh

set -e

echo-info "Importing personal GPG keys"

echo-eval 'op get document "Personal GPG Key - George Witteman (AE0381FB) – Public.asc" | gpg --batch --import'
echo-eval 'op get document "Personal GPG Key - George Witteman (AE0381FB) – Secret.asc" | gpg --batch --import'
