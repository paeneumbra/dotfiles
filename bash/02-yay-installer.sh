#!/bin/bash

set -e

PKGS=(
  redshift

  nerd-fonts-complete

  python-pynvim

  vscodium-bin
  pip-tools

  brave-bin
)

for PKG in "${PKGS[@]}"; do
  echo
  echo "INSTALLING PACKAGE: $PKG"
  yay -S "$PKG" --noconfirm --needed
done

echo
echo "Installation is done"
echo
