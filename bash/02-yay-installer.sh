#!/bin/bash

set -e

PKGS=(
  redshift

  nerd-fonts-complete
  ttf-nerd-fonts-symbols

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
