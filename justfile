default: lint sanity

verbose := "false"

lint: shellcheck shfmt

apply:
  chezmoi apply

shfmt: apply
  cd "$HOME" && "${HOME}/.scripts/get-files-to-lint" | xargs shfmt --indent 2 --case-indent -diff --simplify

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
      "$sh" "$@" -elic exit
      "$sh" "$@" -elc exit
      "$sh" "$@" -eic exit
      "$sh" "$@" -euc exit

      env -i HOME="$HOME" "$sh" "$@" -elic exit
      env -i HOME="$HOME" "$sh" "$@" -elc exit
      env -i HOME="$HOME" "$sh" "$@" -eic exit
      env -i HOME="$HOME" "$sh" "$@" -euc exit
    fi
  done
