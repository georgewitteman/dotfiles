if [ ! -d "${XDG_CACHE_DIR:-${HOME}/.cache}/zsh-autosuggestions" ]; then
  echo_run git clone git@github.com:zsh-users/zsh-autosuggestions.git \
    "${XDG_CACHE_DIR:-${HOME}/.cache}/zsh-autosuggestions"
fi

ZSH_AUTOSUGGEST_USE_ASYNC=true
source "${XDG_CACHE_DIR:-${HOME}/.cache}/zsh-autosuggestions/zsh-autosuggestions.zsh"
