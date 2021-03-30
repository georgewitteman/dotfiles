if [ -n "$VIRTUAL_ENV" ]; then
  __zsh_prompt_venv="$VIRTUAL_ENV"
  deactivate
fi
if command -v starship >/dev/null 2>/dev/null; then
  eval "$(starship init zsh)"
fi
if [ -n "$__zsh_prompt_venv" ]; then
  source "${__zsh_prompt_venv}/bin/activate"
  unset __zsh_prompt_venv
fi
