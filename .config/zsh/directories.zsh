# Changing/making/removing directory
DIRSTACKSIZE=8
setopt auto_cd # If the command is just a directory go there
setopt auto_pushd # Automatically push directories onto the directory stack
setopt pushd_ignore_dups # Don't add duplicates onto the directory stack
setopt pushdminus # Swap the meaning of cd +1 and cd -1

alias md='mkdir -p'
alias rd=rmdir

alias l='ls'
alias ll='ls -lh'
alias la='ls -lah'
