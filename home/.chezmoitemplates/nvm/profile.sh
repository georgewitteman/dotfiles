export NVM_DIR="${NVM_DIR:-"${HOME}/.nvm"}"

load_file() {
  read -r line <"$1"

  for node_bin in "${NVM_DIR}/versions/node/v${line#v}"*"/bin"; do
    [ -d "$node_bin" ] || continue
    PATH="${node_bin}:${PATH}"
    break
  done >/dev/null 2>&1

  unset line
  unset node_bin
}

# Load default node version. It's done like this to stay performant.
if [ -f "${PWD}/.node-version" ]; then
  load_file "${PWD}/.node-version"
elif [ -f "${NVM_DIR}/alias/default" ]; then
  load_file "${NVM_DIR}/alias/default"
fi

unset -f load_file
