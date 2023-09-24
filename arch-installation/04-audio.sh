#!/bin/bash

set -e

PKGS=(
    # https://wiki.archlinux.org/title/Bluetooth
    pipewire
    pipewire-alsa
    pipewire-pulse
    pipewire-jack
    qpwgraph
    wireplumber
    bluez
    bluez-utils
    bluez-hid2hci
)

for PKG in "${PKGS[@]}"; do
    echo
    echo "INSTALLING PACKAGE: $PKG"
    yay -S "$PKG" --noconfirm --needed
done

echo
echo "Installation is done"
echo
