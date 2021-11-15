#!/bin/sh

echo "Use ssh repo URL for dotfiles repo:"
echo '  $ (cd "$(chezmoi source-path)" && git-https-to-ssh)'
echo
echo "You can now run specific installers for any programs you need:"
ls ~/bin/install* | xargs -n 1 basename | xargs -n 1 printf "  $ %s\n"
echo
echo "Restart your terminal:"
echo "  $ exec ${SHELL:-/bin/bash} -li"
