#!/bin/sh

set -e

echo-info "Sourcing ~/.profile"
set -x
source "${HOME}/.profile"
set +x

update-all
