#!/bin/bash

set -e


PKGS=(
    dkms
    xorg-server
    xorg-xinit
    nvidia-dkms

    # cutefish
    noto-fonts

    # mate
    # mate-extra

    bspwm
    sxhkd
)

for PKG in ${PKGS[@]};
do
    echo
    echo "INSTALLING PACKAGE: $PKG"
    sudo pacman -S "$PKG" --noconfirm --needed
done

echo
echo "Installation is done"
echo
