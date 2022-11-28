default: lint test

verbose := "false"

check: test

lint: shellcheck shfmt

apply:
  chezmoi apply

shfmt: apply
  cd "$HOME" && "${HOME}/.scripts/get-files-to-lint" | xargs shfmt --indent 2 --case-indent -diff --simplify

shellcheck: apply
  cd "$HOME" && "${HOME}/.scripts/get-files-to-lint" | sed "s#${HOME}/##" | xargs shellcheck

test: apply
  #!/bin/sh
  set -o errexit
  if {{ verbose }}; then
    set -- -x
  fi
  for test_file in ./tests/test_*; do
    echo "RUNNING: ${test_file}"
    sh "$@" -eu "$test_file"
    echo "PASSED: ${test_file}"
  done
