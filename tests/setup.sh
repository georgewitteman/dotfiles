set -o errexit

fail() {
  echo "FAIL: $*" >&2
  exit 1
}
