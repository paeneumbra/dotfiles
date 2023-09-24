#!/bin/bash

set -e

PKGS=(
  gnome
  gnome-extra

  # GTK Themes
  gtk-engine-murrine
  gtk-engines
  qogir-gtk-theme
)

for PKG in "${PKGS[@]}"; do
  echo
  echo "INSTALLING PACKAGE: $PKG"
  yay -S "$PKG" --noconfirm --needed
done

echo
echo "Installation is done"
echo
