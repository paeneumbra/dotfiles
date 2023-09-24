#!/bin/bash

set -e

PKGS=(
  # Neovim
  prettier
  npm

  # JVM
  jre8-openjdk
  jre11-openjdk
  jdk11-openjdk
  jre17-openjdk
  jdk17-openjdk
  kotlin
  gradle
  groovy

  # Lua
  lua
  luarocks
  stylua

  # Python
  python
  python-pip
  python-virtualenv
  python-pipenv
  python-pynvim
  python-setuptools
  python-black
  python-pre-commit
  pip-tools
  flake8

  # IDE
  intellij-idea-community-edition
  pycharm-community-edition
  vscodium-bin

  # Docker
  docker
  docker-compose

  # Misc
  jq
  yq
  slack-desktop
  zsa-wally
)

for PKG in "${PKGS[@]}"; do
  echo
  echo "INSTALLING PACKAGE: $PKG"
  yay -S "$PKG" --noconfirm --needed
done

echo
echo "Installation is done"
echo
