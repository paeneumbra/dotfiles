#!/bin/bash

set -uo pipefail

PKGS=(
  seahorse
  calibre
  obsidian
  slack-desktop-wayland
  spotify
  ticktick
  thunderbird
  signal-desktop
  zen-browser
  chromium
)

echo "Installing packages"

for PKG in "${PKGS[@]}"; do
  echo "Installing package: $PKG"
  paru -S "$PKG" --noconfirm --needed
done
