#!/bin/sh

echo "Installed base files!"
echo "You can now run specific installers for any programs you need:"
ls ~/bin/install* | xargs -n 1 basename | xargs -n 1 echo " "
