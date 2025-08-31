#!/bin/bash

set -uo pipefail

PKGS=(
  # AMD
  xf86-video-amdgpu
  mesa-utils
  vulkan-radeon
  # Nvidia
  dkms
  nvidia-open-dkms
  nvidia-utils
  libvdpau
  libva-nvidia-driver
  egl-wayland
  fwupd
)

echo "Installing packages"

for PKG in "${PKGS[@]}"; do
  echo "Installing package: $PKG"
  sudo pacman -S "$PKG" --noconfirm --needed
done

PARUPKGS=(
  # AMD
  amdgpu_top
  # Asus
  # https://wiki.archlinux.org/title/Asusctl
  # https://asus-linux.org/manual/asusctl-manual/
  # https://asus-linux.org/manual/supergfxctl-manual/
  supergfxctl
  rog-control-center
  asusctl
)

echo "Installing packages"

for PARU in "${PARUPKGS[@]}"; do
  echo "Installing package: $PARU"
  paru -S "$PARU" --noconfirm --needed
done

echo "Setting asus services"

sudo systemctl enable --now asusd.service
sudo systemctl enable --now supergfxd.service
