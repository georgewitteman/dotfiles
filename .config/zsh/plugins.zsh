if [ ! -e "$ZDOTDIR/zgen/zgen.zsh" ]; then
 git clone git@github.com:tarjoilija/zgen "$ZDOTDIR/zgen"
fi

source "$ZDOTDIR/zgen/zgen.zsh"

if ! zgen saved; then
  zgen load zsh-users/zsh-completions
  zgen load zsh-users/zsh-history-substring-search
  zgen load ael-code/zsh-colored-man-pages
  zgen load $HOME/Code/georgewitteman/affirm-scripts-zsh
  zgen load $HOME/Code/georgewitteman/zsh-prompt

  zgen save
fi
