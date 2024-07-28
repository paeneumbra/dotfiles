#!/bin/bash

set -uo pipefail

# Define some colors for output
GREEN=$(tput setaf 2)
RESET=$(tput sgr0)

# Print an info message
function print_info() {
  echo -e "${GREEN}$1${RESET}"
}

PKGS=(
  steam
  # https://wiki.archlinux.org/title/Minecraft
  minecraft-launcher
)

print_info "Installing games"

for PKG in "${PKGS[@]}"; do
  echo
  print_info "Installing package: $PKG"
  yay -S "$PKG" --noconfirm --needed
done

print_info "games installation complete"
