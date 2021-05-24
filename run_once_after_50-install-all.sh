#!/bin/sh

set -e

echo-info "Sourcing ~/.profile"
set -x
. "${HOME}/.profile"
set +x

update-all
