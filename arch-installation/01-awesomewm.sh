#!/bin/bash

set -e

PKGS=(
  #Lua based WM
  #https://wiki.archlinux.org/title/Awesome
  awesome-git
  bluetuith
  brightnessctl
  picom
  redshift
  rofi
  xtitle
)

for PKG in "${PKGS[@]}"; do
  echo
  echo "INSTALLING PACKAGE: $PKG"
  yay -S "$PKG" --noconfirm --needed
done

echo
echo "Installation is done"
echo
