#!/bin/bash

set -e

PKGS=(
  gnome
  gnome-extra
  gnome-software

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

# gmd is required for gnome, but conflicts with gdm-prime, which is required for prime usage

yay -Rs gdm --noconfirm
yay -S gdm-prime --noconfirm --needed
yay -S gdm-settings --noconfirm --needed

echo
echo "Installation is done"
echo
