#!/bin/bash

set -uo pipefail

PKGS=(
  niri
  waybar
  alacritty
  xdg-desktop-portal-gtk
  xdg-desktop-portal-gnome
  xwayland-satellite
  udiskie
  qt5-wayland
  qt6-wayland
  polkit-kde-agent
  brightnessctl
  cava
  cliphist
  wl-clipboard
  nwg-look
  # quickshell+dms
  dgop
)

echo "Installing packages"

for PKG in "${PKGS[@]}"; do
  echo "Installing package: $PKG"
  sudo pacman -S "$PKG" --noconfirm --needed
done

PARUPKGS=(
  # quickshell dms
  adw-gtk-theme
  dms-shell-bin
  matugen-git
  dsearch-bin
  qt6ct-kde
)

echo "Installing hypr AUR packages"

for PPKG in "${PARUPKGS[@]}"; do
  echo "Installing package: $PPKG"
  paru -S "$PPKG" --noconfirm --needed
done

echo "Packages installed"
echo "Set dark mode for gtk"

dconf write /org/gnome/desktop/interface/color-scheme '"prefer-dark"'
