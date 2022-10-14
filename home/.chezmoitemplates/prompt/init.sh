if [ "$(id -u || true)" -eq 0 ]; then
  PS1='$PWD $'
else
  PS1='$PWD $ '
fi
PS2='> '
PS4='+ '
