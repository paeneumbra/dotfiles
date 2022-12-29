#!/bin/bash

set -e


PKGS=(
	zsh
	zsh-completions
	neovim
	ranger 
	openssh
	stow
	starship
	alacritty
	tree
	fd
	fzf
	ripgrep
	ttf-fira-code
	glow
	git-filter-repo
	ueberzug
	zathura
	zathura-cb
	zathura-pdf-mupdf
	neofetch
    prettier
)

for PKG in ${PKGS[@]};
do
    echo
    echo "INSTALLING PACKAGE: $PKG"
    sudo pacman -S "$PKG" --noconfirm --needed
done

echo
echo "Installation is done"
echo
