if [ ! -d "${XDG_CACHE_DIR:-${HOME}/.cache}/zsh-syntax-highlighting" ]; then
  echo_run git clone git@github.com:zsh-users/zsh-syntax-highlighting.git \
    "${XDG_CACHE_DIR:-${HOME}/.cache}/zsh-syntax-highlighting"
fi

source "${XDG_CACHE_DIR:-${HOME}/.cache}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
