#!/bin/bash

set -e

PKGS=(
  # https://wiki.archlinux.org/title/Steam
  steam
  # https://wiki.archlinux.org/title/Minecraft
  minecraft-launcher
)

for PKG in "${PKGS[@]}"; do
  echo
  echo "INSTALLING PACKAGE: $PKG"
  yay -S "$PKG" --noconfirm --needed
done

echo
echo "Installation is done"
echo
