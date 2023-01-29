#!/bin/bash

set -e

PKGS=(
    firefox
    thunderbird
    calibre
    brave-bin

  # Gnome
  #https://wiki.archlinux.org/title/GNOME
  #https://archlinux.org/groups/x86_64/gnome/
  baobab
  cheese
  gnome-control-center
  xdg-user-dirs-gtk
  gnome-tweaks
  nautilus
  extension-manager

  # Dev tools
  intellij-idea-community-edition
  pycharm-community-edition
  python-pynvim
  pip-tools
  vscodium-bin
  zsa-wally

  # Fonts
  nerd-fonts-complete
  noto-fonts
  ttf-fira-code
  ttf-material-design-icons-webfont
  ttf-nerd-fonts-symbols-common
  ttf-roboto
)

for PKG in "${PKGS[@]}"; do
    echo
    echo "INSTALLING PACKAGE: $PKG"
    yay -S "$PKG" --noconfirm --needed
done

echo
echo "Installation is done"
echo
