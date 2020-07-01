# Load Order         Interactive  Interactive  Script
# Startup            Only login   Always
# ------------------ -----------  -----------  ------
# /etc/zshenv             1            1         1
# $ZDOTDIR/.zshenv        2            2         2
# /etc/zprofile           3
# $ZDOTDIR/.zprofile      4
# /etc/zshrc              5            3
# $ZDOTDIR/.zshrc         6            4
# /etc/zlogin             7
# $ZDOTDIR/.zlogin        8
#
# Shutdown
# ------------------ -----------  -----------  ------
#   ~/.zlogout            9
# /etc/zlogout           10
#
# Note: ZSH seems to read ~/.profile as well, if ~/.zshrc is not present.
# `.zprofile' is meant as an alternative to `.zlogin' for ksh fans; the two are
# not intended to be used together

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

# Homebrew paths
path=("/usr/local/bin" "/usr/local/sbin" $path)

# The ~/.pyenv/versions file is saved in yadm, so use the bin directory to
# check if pyenv is installed
if [[ -d "$HOME/.pyenv/bin" ]]; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PYENV_SHELL="zsh"
  [[ -d "$PYENV_ROOT/bin" ]] && path=("$PYENV_ROOT/bin" $path)
  [[ -d "$PYENV_ROOT/shims" ]] && path=("$PYENV_ROOT/shims" $path)
fi
# Leaving this here so other install scripts think that it's here, since I'm
# setting the path manually
# if command -v pyenv 1>/dev/null 2>&1; then
#   eval "$(pyenv init - --no-rehash zsh)"
# fi

if [[ ! -f "$HOME/.local/bin" ]]; then
  mkdir -p "$HOME/.local/bin"
fi
path=("$HOME/.local/bin" $path)

# Add arcanist to path if it's installed
[[ -d ~/.phabricator/arcanist/bin ]] && path=("$HOME/.phabricator/arcanist/bin" $path)

# ASDF (needs to be above the fpath set for asdf completions below because we
# need the $ASDF_DIR variable
[[ -f ~/.asdf/asdf.sh ]] && source ~/.asdf/asdf.sh

# Rust
[[ -d "$HOME"/.cargo ]] && path=("$HOME/.cargo/bin" $path)

export PATH="$PATH"

# No duplicates in fpath
typeset -U fpath

# Set up fpath for my autoloaded functions
fpath=(${XDG_CONFIG_HOME:-$HOME/.config}/zsh/autoload/ $fpath)
autoload -Uz ${XDG_CONFIG_HOME:-$HOME/.config}/zsh/autoload/**/*

# Set up fpath for asdf completions
[[ -n "$ASDF_DIR" ]] && [[ -d "$ASDF_DIR" ]] && fpath=($ASDF_DIR/completions $fpath)

fpath=(${XDG_CONFIG_HOME:-$HOME/.config}/zsh/completions $fpath)

[[ -d "/usr/share/zsh/site-functions" ]] && fpath+=("/usr/share/zsh/site-functions")

zplug add zsh-prompt git@github.com:georgewitteman/zsh-prompt.git || true
zplug add zsh-ctrl-z git@github.com:georgewitteman/zsh-ctrl-z.git || true
zplug add zsh-pyenv git@github.com:georgewitteman/zsh-pyenv.git || true
zplug add zsh-prompt-benchmark git@github.com:romkatv/zsh-prompt-benchmark.git || true
zplug init

if [[ -n "$VIRTUAL_ENV" ]]; then
  # Allows you to `rc` (reload config, see aliases below) from inside a virtual
  # environment without losing the virtual environment. Normally `exec` keeps
  # all environment variables, but certain ones get overwritten during zsh
  # initialization. This reinitializes them
  source "$VIRTUAL_ENV/bin/activate"
fi

export CLICOLOR=1
export LSCOLORS="exfxcxdxbxegedabagacad"
export LS_COLORS="di=34:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"

# Fixes gpg when "GPG Suite" is not installed (i.e. gpg is installed from homebrew)
export GPG_TTY="$TTY"

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

# [r]eload [c]onfig
alias rc='exec $SHELL --login --interactive'
# [e]dit [c]onfig
alias ec='$EDITOR ~/.zshrc'

alias zplugins='cd ~/.config/zsh/plugins'

# Suffix aliases: Open the file in preferred program just by typing
#                 `$ <file_name><CR>`
alias -s {py,md}=vim
# Paste in a git repository url and it will automatically clone it
alias -s git='git clone'

alias make_venv='python3 -m venv .venv'
alias activate='source .venv/bin/activate'
alias de='deactivate'

# Tmux sessions
alias default='new_or_switch_tmux default ~/'
alias misc='default'

if (( ! $+commands[sudoedit] )); then
  alias sudoedit='sudo -e'
fi

# Always use local package jest
if (( $+commands[yarn] )); then
  alias jest='yarn run jest'
fi

# -F adds characters to indicate what kind of file it is (e.g. "/" for directories)
alias ls='ls -F'
alias ll='ls -l'
alias la='ls -la'

# Kubernetes
if (( $+commands[kubectl] )); then
  alias k='kubectl'
fi

# Terraform
if (( $+commands[terraform] )); then
  alias t='terraform'
fi

# Git
if (( $+commands[git] )); then
  alias gs='echo_run status'
  alias gf='git fetch && g'
  alias develop='master'
  alias switch='echo_run git switch'
  alias gdiff='echo_run git diff'
fi

# yadm
if (( $+commands[yadm] )); then
  alias y='yadm'
  alias ys='echo_run yadm status'
  alias ypush='echo_run yadm push'
  alias ydiff='echo_run yadm diff'
fi

alias c='clear'

alias d='print -P "%~"'

if (( $+commands[brew] )); then
  compdef brew_helper='brew'
  alias brew='brew_helper'
fi

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
if [[ ! -f "${XDG_DATA_HOME:-$HOME/.local/share}/.zsh_history" ]]; then
  mkdir -p "${XDG_DATA_HOME:-$HOME/.local/share}"
fi
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
