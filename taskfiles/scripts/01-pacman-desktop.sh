#!/bin/bash

set -uo pipefail

PKGS=(
  vim
  openssh
  htop
  smartmontools
  xdg-utils
  brightnessctl
  bottom
  # https://wiki.archlinux.org/title/PipeWire
  pipewire
  pipewire-alsa
  pipewire-jack
  pipewire-pulse
  gst-plugin-pipewire
  libpulse
  wireplumber
  helvum
  pavucontrol
  # https://wiki.archlinux.org/title/Bluetooth
  bluez
  bluez-utils
  bluez-hid2hci
  bluetui
  # https://wiki.archlinux.org/title/Iwd
  iwd
  wireless_tools
  wpa_supplicant
  networkmanager
)

echo "Installing packages"

for PKG in "${PKGS[@]}"; do
  echo "Installing package: $PKG"
  sudo pacman -S "$PKG" --noconfirm --needed
done

echo "Setting wireless and bluetooth services"

sudo systemctl enable --now bluetooth.service
sudo systemctl enable --now NetworkManager
