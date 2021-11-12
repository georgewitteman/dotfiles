#!/bin/sh

echo "Installed base files!"
echo "Restart your terminal 'exec ${SHELL:-/bin/bash} -li'"
echo "You can now run specific installers for any programs you need:"
ls ~/bin/install* | xargs -n 1 basename | xargs -n 1 echo " "
