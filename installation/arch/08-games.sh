#!/bin/bash

set -e

PKGS=(
  #https://github.com/Askannz/optimus-manager#gnome-gdm
  gdm-prime
  xinit-xsession
  #https://github.com/Askannz/optimus-manager
  optimus-manager
  # https://wiki.archlinux.org/title/Steam
  # Run with nvidia by setting "prime-run %command%"
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
