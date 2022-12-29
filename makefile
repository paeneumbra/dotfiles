# Makefile

pacman-install:
	./bash/00-installer.sh

stow-sys:
	 exec stow --verbose --dir=$(HOME)/workspace --target=$(HOME) sys

default-zsh:
	mkdir -p $(HOME)/.cache/zsh
	sudo chsh -s $$(which zsh)
	echo "Restart to enable zsh"

install-yay:
	mkdir -p repositories/yay
	git clone https://aur.archlinux.org/yay.git repositories/yay
	(cd repositories/yay && makepkg -si)

yay-install:
	./bash/01-yay-installer.sh

logiops-install:
	sudo pacman -S cmake libevdev libconfig pkgconf
	mkdir -p repositories/logiops
	git clone https://github.com/PixlOne/logiops.git repositories/logiops
	mkdir -p repositories/logiops/build
	(cd repositories/logiops/build && cmake .. && make)
	(cd repositories/logiops/build && sudo make install)
	sudo systemctl enable --now logid
