#!/bin/bash

set -uo pipefail

# Define some colors for output
GREEN=$(tput setaf 2)
RESET=$(tput sgr0)

# Print an info message
function print_info() {
  echo
  echo -e "${GREEN}$1${RESET}"
}

PKGS=(
  bash-completion
  bat
  fd
  fish
  fzf
  poppler
  ripgrep
  ripgrep-all
  starship
  stow
  yazi
  zoxide
  zsh
)

CASKS=(
  alacritty
  wezterm
  ghostty
  kitty
  font-fira-code
  font-fira-mono-nerd-font
  font-iosevka
  font-iosevka-nerd-font
  font-iosevka-term-nerd-font
  font-noto-mono
  font-noto-emoji
  font-zed-mono-nerd-font
)

print_info "Installing terminal packages"

for PKG in "${PKGS[@]}"; do
  print_info "INSTALLING PACKAGE: $PKG"
  brew install "$PKG"
done

for CASK in "${CASKS[@]}"; do
  print_info "INSTALLING PACKAGE: $CASK"
  brew install --cask "$CASK"
done
