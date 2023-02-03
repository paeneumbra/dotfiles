#!/bin/bash

set -e

PKGS=(
  #https://wiki.archlinux.org/title/Bspwm
  bspwm
  sxhkd
  picom
  dunst
  rofi
  polybar
  bluetuith
  light
  pavucontrol
  xdo
  xtitle

  #gtk
  baobab
  cheese
  gnome-font-viewer
  nautilus
  xdg-user-dirs-gtk
)

for PKG in "${PKGS[@]}"; do
  echo
  echo "INSTALLING PACKAGE: $PKG"
  yay -S "$PKG" --noconfirm --needed
done

echo
echo "Installation is done"
echo
