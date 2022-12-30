#!/bin/bash

set -e

PKGS=(
  dkms
  xorg-server
  xorg-xinit
  nvidia-dkms

  #https://wiki.archlinux.org/title/Bspwm
  #bspwm
  #sxhkd

  #Python based WM
  #https://wiki.archlinux.org/title/Qtile
  #qtile

  #Lua based WM
  #https://wiki.archlinux.org/title/Awesome
  #awesome
)

for PKG in "${PKGS[@]}"; do
  echo
  echo "INSTALLING PACKAGE: $PKG"
  sudo pacman -S "$PKG" --noconfirm --needed
done

echo
echo "Installation is done"
echo
