#!/bin/bash

set -e

PKGS=(
    # https://wiki.archlinux.org/title/Steam
    steam
)

for PKG in "${PKGS[@]}"; do
  echo
  echo "INSTALLING PACKAGE: $PKG"
  sudo pacman -S "$PKG" --noconfirm --needed
done

# https://wiki.archlinux.org/title/Minecraft
echo "Installing minecraft"
yay -S minecraft-launcher --noconfirm --needed

echo
echo "Installation is done"
echo
