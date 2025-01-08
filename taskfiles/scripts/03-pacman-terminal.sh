#!/bin/bash

set -uo pipefail

PKGS=(
  alacritty
  bash-completion
  bat
  fd
  fish
  fzf
  ghostty
  man-db
  man-pages
  p7zip
  poppler
  ripgrep
  ripgrep-all
  starship
  stow
  yazi
  zoxide
  zsh
  # Fonts
  noto-fonts
  noto-fonts-emoji
  ttf-fira-code
  ttf-firacode-nerd
  ttf-iosevka-nerd
  ttf-iosevkaterm-nerd
  ttf-nerd-fonts-symbols
  ttf-zed-mono-nerd
)

echo "Installing terminal related packages"

for PKG in "${PKGS[@]}"; do
  echo "Installing package: $PKG"
  sudo pacman -S "$PKG" --noconfirm --needed
done
