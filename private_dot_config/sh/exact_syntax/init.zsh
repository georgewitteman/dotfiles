if [ ! -d "${XDG_CACHE_DIR:-${HOME}/.cache}/fast-syntax-highlighting" ]; then
  echo "Install zsh syntax highlighting with:"
  echo "  git clone https://github.com/zdharma/fast-syntax-highlighting.git" \
    "${XDG_CACHE_DIR:-~/.cache}/fast-syntax-highlighting"
fi

if [ -t 0 ] && [ -t 1 ] && [ -d "${XDG_CACHE_DIR:-${HOME}/.cache}/fast-syntax-highlighting" ]; then
  source "${XDG_CACHE_DIR:-${HOME}/.cache}/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh"
fi
