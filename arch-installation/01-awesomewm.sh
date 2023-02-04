#!/bin/bash

set -e

PKGS=(
  #Lua based WM
  #https://wiki.archlinux.org/title/Awesome
  awesome-git
  picom
  rofi
  redshift
  bluetuith
  brightnessctl
  ttf-nerd-fonts-symbols-2048-em-mono
  ttf-material-design-icons-webfont
  wezterm

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
