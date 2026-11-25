# shellcheck shell=sh

fail() {
  echo "FAIL: $*" >&2
  exit 1
}
