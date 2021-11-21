if [ -t 0 ] && [ -t 1 ] && [ -d "${XDG_CACHE_DIR:-${HOME}/.cache}/fast-syntax-highlighting" ]; then
  source "${XDG_CACHE_DIR:-${HOME}/.cache}/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh"
fi
