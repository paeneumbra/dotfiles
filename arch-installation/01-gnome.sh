#!/bin/bash

set -e

PKGS=(
  # My Basic Gnome
  #https://wiki.archlinux.org/title/GNOME
  #https://archlinux.org/groups/x86_64/gnome/
  baobab
  cheese
  gnome-control-center
  gnome-font-viewer
  gnome-session
  gnome-settings-daemon
  gnome-shell
  gnome-shell-extensions
  mutter
  tracker3-miners
  xdg-user-dirs-gtk
  gnome-tweaks
  nautilus

  #Python based WM
  #https://wiki.archlinux.org/title/Qtile
  #qtile
)

for PKG in "${PKGS[@]}"; do
  echo
  echo "INSTALLING PACKAGE: $PKG"
  sudo pacman -S "$PKG" --noconfirm --needed
done

yay -S bluetuith xtitle --noconfirm --needed

echo
echo "Installation is done"
echo
