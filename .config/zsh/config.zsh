if [[ "$ZPROF" = true ]]; then
  zmodload zsh/zprof
fi
zmodload zsh/datetime
ZSH_STARTUP_TIMER=$EPOCHREALTIME

# No duplicates in path
typeset -U path

# Setup env specific stuff
source $ZDOTDIR/env.zsh

# Enable autoloading of functions
source $ZDOTDIR/autoload.zsh

# Make sure colors are enabled
source $ZDOTDIR/colors.zsh

# Plugins
source $ZDOTDIR/plugins.zsh

# My files
source $ZDOTDIR/key-bindings.zsh
source $ZDOTDIR/history.zsh
source $ZDOTDIR/aliases.zsh
source $ZDOTDIR/variables.zsh
source $ZDOTDIR/directories.zsh
source $ZDOTDIR/completion.zsh

# FZF (keep last for keybindings)
source $XDG_CONFIG_HOME/fzf/fzf.zsh

# ASDF
source $XDG_DATA_HOME/asdf/asdf.sh
source $XDG_DATA_HOME/asdf/completions/asdf.bash

# PYENV
path=($PYENV_ROOT/shims $path)

if [ $ZSH_STARTUP_TIMER ]; then
  local now
  local startup_diff
  local max_time
  local time_color="${fg_bold[default]}"
  startup_diff=$((($EPOCHREALTIME * 1000) - ($ZSH_STARTUP_TIMER * 1000)))

  (( $startup_diff >= 150 )) && \
    time_color="${fg_bold[red]}"

  echo -n "Hi ${fg_bold[default]}${USERNAME}${reset_color}, "
  echo "zsh startup took ${time_color}${startup_diff[0,8]}ms${reset_color}"

  unset ZSH_STARTUP_TIMER
fi
if [[ "$ZPROF" = true ]]; then
  zprof
fi
