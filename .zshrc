# http://zsh.sourceforge.net/Intro/intro_3.html
# `.zshrc' is sourced in interactive shells. It should contain commands to set
# up aliases, functions, options, key bindings, etc.

# ----- NOTES FROM DOCUMENTATION ----------------------------
#
# WHY USE [[ ]] INSTEAD OF [ ]: Second aside for users of sh: you may remember
# that tests in sh used a single pair of brackets, `if [ ... ]; then ...', or
# equivalently as a command called test, `if test ...; then ...'. The Korn
# shell was deliberately made to be different, and zsh follows that. The reason
# is that `[[' is treated specially, which allows the shell to do some extra
# checks and allows more natural syntax. For example, you may know that in sh
# it's dangerous to test a parameter which may be empty: `[ $var = foo ]' will
# fail if $var is empty, because in that case the word is missed out and the
# shell never knows it was supposed to be there; with `[[ ... ]]', this is
# quite safe because the shell is aware there's a word before the `=', even if
# it's empty. Also, you can use `&&' and `||' to mean logical `and' and `or',
# which agrees with the usual UNIX/C convention; in sh, they would have been
# taken as starting a new command, not as part of the test, and you have to use
# the less clear `-a' and `-o'. Actually, zsh provides the old form of test for
# backward compatibility, but things will work a lot more smoothly if you don't
# use it.
#
# STARTUP FILE ORDER AND PURPOSE: Certain options from earlier startup files
# can prevent later startup files from running
#  - /etc/zshenv: Always run for every zsh
#  - ~/.zshenv: Usually run for every zsh
#  - /etc/profile: Run for login shells
#  - ~/.zprofile: Run for login shells
#  - /etc/zshrc: Run for interactive shells
#  - ~/.zshrc: Run for interactive shells
#  - /etc/zlogin: Run for login shells
#  - ~/.zlogin: Run for login shells

if [[ "$ZPROF" = true ]]; then
  zmodload zsh/zprof
fi

export EDITOR='vim'

# No duplicates in path
typeset -U path

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
(( $+commands[pyenv] )) && path=($PYENV_ROOT/shims $path)
# Leaving this here so other install scripts think that it's here, since I'm
# setting the path manually
# if command -v pyenv 1>/dev/null 2>&1; then
#   eval "$(pyenv init - --no-rehash zsh)"
# fi

# ASDF (needs to be above the fpath set for asdf completions below because we
# need the $ASDF_DIR variable
[[ -f ~/.asdf/asdf.sh ]] && source ~/.asdf/asdf.sh

# No duplicates in fpath
typeset -U fpath

# Set up fpath for my autoloaded functions
fpath=(${XDG_CONFIG_HOME:-$HOME/.config}/zsh/autoload/ $fpath)
autoload -Uz ${XDG_CONFIG_HOME:-$HOME/.config}/zsh/autoload/**/*

# Set up fpath for asdf completions
fpath=($ASDF_DIR/completions $fpath)

fpath=(${XDG_CONFIG_HOME:-$HOME/.config}/zsh/completions $fpath)

if [[ ! -e "${XDG_DATA_HOME:-$HOME/.local/share}/zgen/zgen.zsh" ]]; then
 git clone git@github.com:georgewitteman/zgen "${XDG_DATA_HOME:-$HOME/.local/share}/zgen"
fi

# non-default location
COMPDUMP_FILE=${XDG_CACHE_HOME:-$HOME/.cache}/zcompdump
plugins_path="${XDG_CONFIG_HOME:-$HOME/.config}/zsh/plugins"

# Make $plugins associative
typeset -A plugins
plugins=() # plugin_name: git_url
plugins+=('zsh-prompt' 'git@github.com:georgewitteman/zsh-prompt.git')

for plugin_name in ${(k)plugins}; do
  plugin_path="$plugins_path/$plugin_name"
  if [[ ! -d "$plugin_path" ]]; then
    git clone ${plugins[$plugin_name]} $plugin_path
  fi
done

# The '(N)' tells zsh to not error when it doesn't find any directories and
# the '(/)' tells it to only look for directories
for plugin_path in $plugins_path/*(/N); do
  plugin_name=${plugin_path##*/}
  plugin_file="$plugin_path/$plugin_name.plugin.zsh"
  [[ -f "$plugin_file" ]] && source "$plugin_file"
  fpath=("$plugin_path" ${fpath})
done

# Initialize completions
autoload -Uz compinit && compinit -C -d "$COMPDUMP_FILE"

alias reinit_comps="rm $COMPDUMP_FILE && autoload -Uz compinit && \
  compinit -d $COMPDUMP_FILE"

export CLICOLOR=1
export LSCOLORS="exfxcxdxbxegedabagacad"
export LS_COLORS="di=34:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"

export PAGER=less

# This affects every invocation of `less`.
#
#   -i   case-insensitive search unless search string contains uppercase letters
#   -R   color
#   -F   exit if there is less than one page of content
#   -X   keep content on screen after exit
#   -M   show more info at the bottom prompt line
#   -x4  tabs are 4 instead of 8
export LESS=-iRFXMx4

alias rc='exec $SHELL --login --interactive'

alias make_venv='python3 -m venv .venv'
alias activate='source .venv/bin/activate'

# Tmux sessions
alias default='new_or_switch_tmux default ~/'
alias misc='default'

# Always use local package jest
alias jest='yarn run jest'

# -F adds characters to indicate what kind of file it is (e.g. "/" for directories)
alias ls='ls -F'
alias ll='ls -l'
alias la='ls -la'

# Git
compdef g='git'
alias gs='git status'
alias gf='git fetch && g'
alias develop='master'

# yadm
compdef y='yadm'
alias y='yadm'
alias ys='yadm status'

alias c='clear'

alias d='print -P "%~"'

# Vim
alias profvim='vim --startuptime startup.log +qall && vim startup.log && rm startup.log'

# Color variables
autoload -U colors && colors

# Use menu for autocompletion when number of items >= 2
zstyle ':completion:*' menu select=2
# Colors for files
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# Verbose completion results
zstyle ':completion:*' verbose true
# Keep directories and files separated
zstyle ':completion:*' list-dirs-first true
# Case insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'l:|=* r:|=*'

DIRSTACKSIZE=8
# If a command is issued that can’t be executed as a normal command, and the
# command is the name of a directory, perform the cd command to that directory
setopt auto_cd
# Make cd push the old directory onto the directory stack
setopt auto_pushd
# Don’t push multiple copies of the same directory onto the directory stack
setopt pushd_ignore_dups
# Exchanges the meanings of ‘+’ and ‘-’ when used with a number to specify a
# directory in the stack
setopt pushd_minus

# The time the shell waits, in hundredths of seconds, for another key to be
# pressed when reading bound multi-character sequences. Useful for vim mode
export KEYTIMEOUT=10

# NOTE: If you want to see what a certain keypress makes do CTRL-V <KEYPRESS>

zmodload zsh/terminfo

autoload -U up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^P' up-line-or-beginning-search
bindkey '^N' down-line-or-beginning-search
[[ "${terminfo[kcuu1]}" != "" ]] && \
  bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search
[[ "${terminfo[kcud1]}" != "" ]] && \
  bindkey "${terminfo[kcud1]}" down-line-or-beginning-search

# Perform history expansion and insert a space into the buffer. If you type a
# space after a command that starts with ! (or ^) to refer to (part of) a
# previous command, that history reference is expanded
bindkey ' ' magic-space
bindkey '^A' beginning-of-line
bindkey '^K' kill-line
bindkey '^W' backward-kill-word
bindkey '^H' backward-delete-char
bindkey '^U' backward-kill-line
bindkey '^R' history-incremental-search-backward
bindkey '^[[1;3C' forward-word # alt-right
bindkey '^[f' forward-word # alt-f
bindkey '^[[1;3D' backward-word # alt-left
bindkey '^[b' backward-word # alt-b
bindkey '^[d' kill-word # alt-d
bindkey "^[[Z" reverse-menu-complete # shift-tab


# History file and size.
HISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}/.zsh_history"
HISTSIZE=10000000
SAVEHIST=10000000
# make some commands not show up in history
export HISTIGNORE="ls:ll:la:cd:cd -:pwd:exit:date:* --help"

# History command configuration
# Treat the '!' character specially during expansion.
setopt bang_hist
# Write the history file in the ":start:elapsed;command" format.
setopt extended_history
# Write to the history file immediately, not when the shell exits.
setopt inc_append_history
# Share history between all sessions.
setopt share_history
# Expire duplicate entries first when trimming history.
setopt hist_expire_dups_first
# Don't record an entry that was just recorded again.
setopt hist_ignore_dups
# Delete old recorded entry if new entry is a duplicate.
setopt hist_ignore_all_dups
# Do not display a line previously found.
setopt hist_find_no_dups
# Don't record an entry starting with a space.
setopt hist_ignore_space
# Don't write duplicate entries in the history file.
setopt hist_save_no_dups
# Remove superfluous blanks before recording entry.
setopt hist_reduce_blanks
# Don't execute immediately upon history expansion.
setopt hist_verify
# Beep when accessing nonexistent history.
setopt hist_beep

# FZF
export FZF_DEFAULT_COMMAND='fd --type f --hidden --exclude .git'

# ------ Keep the following stuff at the bottom of the file --------

# Initialize FZF (keep last for keybindings)
[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh
