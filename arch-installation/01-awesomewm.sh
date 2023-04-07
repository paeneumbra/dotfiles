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
  wezterm

  #gtk
  baobab
  cheese
  gnome-font-viewer
  xdg-user-dirs-gtk

  #xfce
  thunar
  tumbler
  thunar-volman
  thunar-archive-plugin
)

for PKG in "${PKGS[@]}"; do
  echo
  echo "INSTALLING PACKAGE: $PKG"
  yay -S "$PKG" --noconfirm --needed
done

echo
echo "Installation is done"
echo
