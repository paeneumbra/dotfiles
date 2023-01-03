# Makefile

init-submodules:
	git submodule init
	git submodule update

install-base:
	./bash/00-base.sh

install-wm:
	./bash/01-window-manager.sh

install-extra:
	./bash/02-gui-extras.sh

stow-config:
	mkdir -p $(HOME)/.config
	exec stow --verbose --dir=$(HOME)/workspace --target=$(HOME) sys

setup-zsh:
	mkdir -p $(HOME)/.cache/zsh
	sudo chsh -s $$(which zsh)
	echo "Restart to enable zsh"

setup-yay:
	mkdir -p repositories/yay
	git clone https://aur.archlinux.org/yay.git repositories/yay
	(cd repositories/yay && makepkg -si)

install-yay-pkgs:
	./bash/03-yay.sh

setup-bluetooth:
	./bash/04-bluetooth.sh
	sudo systemctl enable --now bluetooth.service

setup-logiops:
	sudo pacman -S cmake libevdev libconfig pkgconf
	mkdir -p repositories/logiops
	git clone https://github.com/PixlOne/logiops.git repositories/logiops
	mkdir -p repositories/logiops/build
	(cd repositories/logiops/build && cmake .. && make)
	(cd repositories/logiops/build && sudo make install)
	sudo systemctl enable --now logid

setup-gaming:
	./bash/08-games.sh

setup-repos:
	./bin/cloneworkspace.py -s ./git/workspace.json -r
	./bin/cloneworkspace.py -s ./git/projects.json -r
