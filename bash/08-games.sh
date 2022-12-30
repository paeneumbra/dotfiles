#!/bin/bash

set -e

PKGS=(
    nvidia-dkms
    nvidia-prime
    nvidia-utils
    lib32-nvidia-utils
    # https://wiki.archlinux.org/title/Steam
    steam
)

for PKG in "${PKGS[@]}"; do
  echo
  echo "INSTALLING PACKAGE: $PKG"
  sudo pacman -S "$PKG" --noconfirm --needed
done

echo
echo "Installation is done"
echo
