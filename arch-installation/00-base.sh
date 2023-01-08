#!/bin/bash

set -e

PKGS=(
  alacritty
  rxvt-unicode
  fd
  feh
  fzf
  git
  git-filter-repo
  maim
  openssh
  redshift
  ripgrep
  starship
  stow
  tree
  wmname
  xclip
  zsh
  zsh-completions
  
  glow
  neofetch

  arandr
  tlp
  fwupd

  neovim
  prettier
  npm

  ranger
  ueberzug

  zathura
  zathura-cb
  zathura-pdf-mupdf

  jre8-openjdk
  jre11-openjdk
  jdk11-openjdk
  jre17-openjdk
  jdk17-openjdk
  kotlin
  gradle
  groovy

  lua
  luarocks
  stylua

  python
  python-pip
  python-virtualenv
  python-pipenv
  python-setuptools
  python-black
  flake8

  jq
  yq
)

for PKG in "${PKGS[@]}"; do
  echo
  echo "INSTALLING PACKAGE: $PKG"
  sudo pacman -S "$PKG" --noconfirm --needed
done

echo
echo "Installation is done"
echo
