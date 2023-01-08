#!/bin/bash

set -e

PKGS=(
    # https://wiki.archlinux.org/title/Bluetooth
    pipewire
    pipewire-pulse
    bluez
    bluez-utils
    bluez-hid2hci
)

for PKG in "${PKGS[@]}"; do
    echo
    echo "INSTALLING PACKAGE: $PKG"
    sudo pacman -S "$PKG" --noconfirm --needed
done

echo
echo "Installation is done"
echo
