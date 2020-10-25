#!/bin/sh

if [ ! -f "${HOME}/.tool-versions" ]; then
  return
fi

while IFS= read -r line || [ -n "$line" ]; do
  case "$line" in
    'golang '*)
      export GOROOT="${HOME}/.local/share/yavm/installs/golang/${line##* }/go"
      export GOPATH="${HOME}/.local/share/yavm/installs/golang/${line##* }/packages"
      PATH="${GOROOT}/bin:${GOPATH}/bin:${PATH}"
      break
      ;;
  esac
done <"${HOME}/.tool-versions"
