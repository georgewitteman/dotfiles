if command -v starship >/dev/null 2>/dev/null; then
  eval "$(starship init bash)"
else
  PS1='\[\033[01;34m\]\w\[\033[00m\] \$ '
fi