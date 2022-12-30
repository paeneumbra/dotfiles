#!/bin/bash

set -e

PKGS=(
    # https://wiki.archlinux.org/title/Bluetooth
    bluez
    bluez-utils
)

for PKG in "${PKGS[@]}"; do
  echo
  echo "INSTALLING PACKAGE: $PKG"
  sudo pacman -S "$PKG" --noconfirm --needed
done

echo
echo "Installation is done"
echo
