default: lint sanity

verbose := "false"

lint: shellcheck shfmt

apply:
  chezmoi apply

shfmt: apply
  cd "$HOME" && "${HOME}/.scripts/get-files-to-lint" | xargs shfmt -i 2 -ci -d -s

shellcheck: apply
  cd "$HOME" && "${HOME}/.scripts/get-files-to-lint" | sed "s#${HOME}/##" | xargs shellcheck

sanity: apply
  #!/bin/sh
  set -o errexit
  set -o xtrace
  if {{ verbose }}; then
    set -- -x
  fi
  for sh in sh bash dash zsh ksh; do
    if command -v "$sh"; then
      "$sh" "$@" -lic exit
      "$sh" "$@" -lc exit
      "$sh" "$@" -ic exit
      "$sh" "$@" -euc exit
    fi
  done
