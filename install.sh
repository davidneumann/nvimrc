#!/usr/bin/env bash

#Base settings
echo "Symlinking all .lua files for nvim"
targetDir="$HOME/.config/nvim/"

mkdir -p "$targetDir"

# Lua files symlinks
find * -name "*.lua" -print0 | while read -d $'\0' file
do
  if [ -e "$targetDir/$file" ]; then
    echo "File exists. Deleting"
    rm "$targetDir/$file"
  fi
  path="$targetDir$file"
  mkdir -p "$(dirname $path)"
  ln -s "$(pwd)/$file" "$targetDir$file"
  echo ln -s \"$(pwd)/$file\" \"$targetDir$file\"
done

# #extensions
# echo "Installing all extensions from extensions.txt"
# while read extension; do
#   echo "Installing $extension"
#   code --install-extension "$extension" > /dev/null
# done <extensions.txt
