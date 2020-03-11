if [ ! -e "$ZDOTDIR/zgen/zgen.zsh" ]; then
 git clone git@github.com:tarjoilija/zgen "$ZDOTDIR/zgen"
fi

source "$ZDOTDIR/zgen/zgen.zsh"

if ! zgen saved; then
  # Handle local zsh plugins
  if [ ! -d "$MY_ZSH_PLUGINS" ]; then
    # unset MY_ZSH_PLUGINS
    MY_ZSH_PLUGINS="git@github.com:"
  elif [ "${MY_ZSH_PLUGINS[-1]}" != "/" ]; then
    MY_ZSH_PLUGINS="$MY_ZSH_PLUGINS"/
  fi

  zgen load zsh-users/zsh-completions
  zgen load zsh-users/zsh-history-substring-search
  zgen load ael-code/zsh-colored-man-pages
  zgen load ${MY_ZSH_PLUGINS}georgewitteman/affirm-scripts-zsh
  zgen load ${MY_ZSH_PLUGINS}georgewitteman/zsh-prompt

  zgen save
fi
