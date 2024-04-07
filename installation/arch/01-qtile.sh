#!/bin/bash

set -e

PKGS=(
  #Python based WM with support for wayland
  #https://wiki.archlinux.org/title/Qtile
  qtile
  dunst
  bluetuith
  brightnessctl
  picom
  redshift
  rofi
  # xtitle
  mypy
  python-iwlib
  python-pytest-subtests
  wmname

  # Wayland support
  # python-pywlroots
  # wlroots
)

for PKG in "${PKGS[@]}"; do
  echo
  echo "INSTALLING PACKAGE: $PKG"
  yay -S "$PKG" --noconfirm --needed
done

echo
echo "Installation is done"
echo
