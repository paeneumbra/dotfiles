# Makefile

init-submodules:
	git submodule init
	git submodule update

install-base:
	./arch-installation/00-base.sh

setup-yay:
	mkdir -p repositories/yay
	git clone https://aur.archlinux.org/yay.git repositories/yay
	(cd repositories/yay && makepkg -si)

install-awesome:
	./arch-installation/01-awesomewm.sh

install-extra:
	./arch-installation/02-extras.sh

install-development:
	./arch-installation/03-development.sh

stow-config:
	mkdir -p $(HOME)/.config
	exec stow --verbose --dir=$(HOME)/workspace --target=$(HOME) sys

setup-zsh:
	mkdir -p $(HOME)/.cache/zsh
	sudo chsh -s $$(which zsh)
	echo "Restart to enable zsh"

setup-audio:
	./arch-installation/04-audio.sh
	systemctl --user enable --now pipewire
	systemctl --user enable --now pipewire
	systemctl --user enable --now wireplumber
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
	./arch-installation/08-games.sh

setup-repos:
	./bin/cloneworkspace.py -s ./git/workspace.json -r
	./bin/cloneworkspace.py -s ./git/projects.json -r
