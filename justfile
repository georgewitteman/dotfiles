lint: shellcheck shfmt

apply:
  chezmoi apply

shfmt: apply
  cd "$HOME" && "${HOME}/.scripts/get-files-to-lint" | xargs shfmt -i 2 -ci -d -s

shellcheck: apply
  cd "$HOME" && "${HOME}/.scripts/get-files-to-lint" | sed "s#${HOME}/##" | xargs shellcheck
