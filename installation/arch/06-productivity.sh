#!/bin/bash

set -e

PKGS=(
  # Apps
  obsidian
  ticktick
)

for PKG in "${PKGS[@]}"; do
  echo
  echo "INSTALLING PACKAGE: $PKG"
  yay -S "$PKG" --noconfirm --needed
done

echo
echo "Installation is done"
echo
