if [ ! -d "${XDG_CACHE_DIR:-${HOME}/.cache}/fast-syntax-highlighting" ]; then
  echo_run git clone git@github.com:zdharma/fast-syntax-highlighting.git \
    "${XDG_CACHE_DIR:-${HOME}/.cache}/fast-syntax-highlighting"
fi

source "${XDG_CACHE_DIR:-${HOME}/.cache}/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh"
