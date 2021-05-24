#!/bin/sh

set -e

echo-info "Sourcing ~/.profile"
. "${HOME}/.profile"

update-all
