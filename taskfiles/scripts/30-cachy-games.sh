#!/bin/bash

set -uo pipefail

PKGS=(
  cachyos-gaming-meta
)

echo "Installing packages"

for PKG in "${PKGS[@]}"; do
  echo "Installing package: $PKG"
  pacman -S "$PKG" --noconfirm --needed
done
