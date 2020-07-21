# Setup fzf
# ---------
if ! whence fzf >/dev/null && [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]] && [[ -d /usr/local/opt/fzf/bin ]]; then
  export PATH="${PATH:+${PATH}:}/usr/local/opt/fzf/bin"
fi

# Auto-completion
# ---------------
if [[ -f "/usr/local/opt/fzf/shell/completion.zsh" ]]; then
  [[ $- == *i* ]] && source "/usr/local/opt/fzf/shell/completion.zsh" 2> /dev/null
elif [[ -f "/usr/share/fzf/completion.zsh" ]]; then
  [[ $- == *i* ]] && source "/usr/share/fzf/completion.zsh" 2> /dev/null
fi

# Key bindings
# ------------
if [[ -f "/usr/local/opt/fzf/shell/key-bindings.zsh" ]]; then
  source "/usr/local/opt/fzf/shell/key-bindings.zsh"
elif [[ -f "/usr/share/fzf/key-bindings.zsh" ]]; then
  source "/usr/share/fzf/key-bindings.zsh"
fi
