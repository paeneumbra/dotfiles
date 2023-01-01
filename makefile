# Makefile

init-submodules:
	git submodule init
	git submodule update

base-install:
	./bash/00-base.sh

wm-install:
	./bash/01-window-manager.sh

extra-install:
	./bash/02-gui-extras.sh

stow-config:
	mkdir -p $(HOME)/.config
	exec stow --verbose --dir=$(HOME)/workspace --target=$(HOME) sys

default-zsh:
	mkdir -p $(HOME)/.cache/zsh
	sudo chsh -s $$(which zsh)
	echo "Restart to enable zsh"

yay-setup:
	mkdir -p repositories/yay
	git clone https://aur.archlinux.org/yay.git repositories/yay
	(cd repositories/yay && makepkg -si)

yay-install:
	./bash/03-yay.sh

bluetooth-setup:
	./bash/04-bluetooth.sh
	sudo systemctl enable --now bluetooth.service

logiops-setup:
	sudo pacman -S cmake libevdev libconfig pkgconf
	mkdir -p repositories/logiops
	git clone https://github.com/PixlOne/logiops.git repositories/logiops
	mkdir -p repositories/logiops/build
	(cd repositories/logiops/build && cmake .. && make)
	(cd repositories/logiops/build && sudo make install)
	sudo systemctl enable --now logid

gaming-setup:
	./bash/08-games.sh

repos-setup:
	./bin/cloneworkspace.py ./git/workspace.json
