alias rc='exec $SHELL'

alias make-venv='python3 -m venv .venv'
alias activate='source .venv/bin/activate'

# Tmux sessions
alias att='new_or_switch_tmux all-the-things ~/Code/Affirm/all-the-things'
alias webux='new_or_switch_tmux web-ux ~/Code/Affirm/web-ux'
alias default='new_or_switch_tmux default ~/'
alias misc='default'

# Hydration
alias h='hydrate'
alias dl='drink_later'
alias nd='next_drink'

# Always use local package jest
alias jest='yarn run jest'

# if type exa >/dev/null 2>&1; then
#   alias ls='exa --modified --created --classify --git --group --header'
# fi
# -F adds characters to indicate what kind of file it is (e.g. "/" for directories)
alias ls='ls -F'
alias ll='ls -l'
alias la='ls -la'

# Git
compdef g='git'
alias gs='git status'
alias gf='git fetch && g'
alias gb="git branch --sort=-committerdate --format='%(if)%(HEAD)%(then)* %(color:bold green)%(else)  %(end)%(refname:short)%(color:nobold normal) (%(committerdate:relative))'"
alias develop='master'

alias c='clear'

alias d='print -P "%~"'

alias vim='nvim'
