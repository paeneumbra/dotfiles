#!/bin/bash

set -uo pipefail

# Minimal installation for dotfiles setup

PKGS=(
  # Apps
  alacritty
  bat
  curl
  fd
  firefox
  fish
  fzf
  ghostty
  git
  go-task
  gvfs
  iwd
  man-db
  man-pages
  neovim
  openssh
  ripgrep
  ripgrep-all
  starship
  stow
  thunar
  wget
  yazi
)

for PKG in "${PKGS[@]}"; do
  echo "INSTALLING PACKAGE: $PKG"
  sudo pacman -S "$PKG" --noconfirm --needed
done

# In linux, task is called go-task, to allow it to run normally is necessary to create a symlink.
# This might break other apps like taskwarrior
echo
echo "Symlinking taskfile"
echo "This might break other apps like taskwarrior"
echo "INFO: to revert the symlink: sudo rm /usr/bin/task"
sudo ln -s /usr/bin/go-task /usr/bin/task

echo
echo "Minimal installation done successfully"
echo
