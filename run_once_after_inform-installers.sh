#!/bin/sh

echo "Installed base files!"
echo
echo "Use ssh repo URL for dotfiles repo:"
echo '  $ (cd "$(chezmoi source-path)" && git-https-to-ssh)'
echo
echo "You can now run specific installers for any programs you need:"
ls ~/bin/install* | xargs -n 1 basename | xargs -n 1 echo " "
echo
echo "Restart your terminal 'exec ${SHELL:-/bin/bash} -li'"
