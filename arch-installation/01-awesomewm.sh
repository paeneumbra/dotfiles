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
  ttf-material-design-icons-webfont
  ttf-nerd-fonts-symbols-2048-em-mono
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
