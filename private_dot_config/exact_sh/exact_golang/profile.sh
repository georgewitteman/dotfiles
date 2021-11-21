#!/bin/sh

if [ -f "${HOME}/.tool-versions" ]; then
  while IFS= read -r line || [ -n "$line" ]; do
    case "$line" in
      'golang '*)
        export GOROOT="${HOME}/.local/share/govm/${line##* }/go"
        export GOPATH="${HOME}/.local/share/govm/${line##* }/packages"
        PATH="${GOROOT}/bin:${GOPATH}/bin:${PATH}"
        break
        ;;
    esac
  done <"${HOME}/.tool-versions"
fi
