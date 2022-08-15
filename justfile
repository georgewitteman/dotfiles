apply:
  chezmoi apply

shfmt: apply
  cd "$HOME" && "${HOME}/.bin/get-files-to-lint" | xargs shfmt -i 2 -ci -d -s

shellcheck: apply
  cd "$HOME" && "${HOME}/.bin/get-files-to-lint" | sed "s#${HOME}/##" | xargs shellcheck

lint: shellcheck shfmt
