#!/bin/bash

set -e

PKGS=(
  firefox
  thunderbird
  calibre
  
  intellij-idea-community-edition
  pycharm-community-edition

  zsa-wally

  noto-fonts
  ttf-fira-code
  ttf-nerd-fonts-symbols-common
)

for PKG in "${PKGS[@]}"; do
  echo
  echo "INSTALLING PACKAGE: $PKG"
  sudo pacman -S "$PKG" --noconfirm --needed
done

echo
echo "Installation is done"
echo
