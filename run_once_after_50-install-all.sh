#!/bin/sh

set -e

echo-info "Sourcing ~/.profile"
source "${HOME}/.profile"

update-all
