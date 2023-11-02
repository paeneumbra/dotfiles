# Makefile

setup-base:
	./00-base.sh

setup-yay:
	mkdir -p $(HOME)/projects/repositories/yay
	git clone https://aur.archlinux.org/yay.git projects/repositories/yay
	(cd $(HOME)/projects/repositories/yay && makepkg -si)

setup-awesome:
	./01-awesomewm.sh

setup-extra:
	./02-extras.sh

setup-development:
	./03-development.sh
	./05-pipx.sh

stow-config:
	mkdir -p $(HOME)/.config
	exec stow --verbose --dir=$(HOME)/workspace/dotfiles --target=$(HOME) common
	exec stow --verbose --dir=$(HOME)/workspace/dotfiles --target=$(HOME) archlinux

setup-zsh:
	mkdir -p $(HOME)/.cache/zsh
	chsh -s $$(which zsh)
	sudo chsh -s $$(which zsh)
	@echo "Restart to enable zsh"

setup-audio:
	./04-audio.sh
	systemctl --user enable --now pipewire
	systemctl --user enable --now pipewire
	systemctl --user enable --now wireplumber
	sudo systemctl enable --now bluetooth.service

setup-gaming:
	./08-games.sh

setup-productivity:
	./06-productivity.sh

init-submodules:
	@echo "Requires ssh configured in github"
	@echo "https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent"
	git submodule init
	git submodule update

setup-repos:
	@echo "Requires ssh configured in github"
	@echo "https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent"
	$(HOME)/workspace/bin/cloneworkspace.py -s ./workspace.json -r

copy-mimelist:
	cp $(HOME)/workspace/installation/arch/extras/mimeapps.list $(HOME)/.config

setup-logiops:
	sudo pacman -S cmake libevdev libconfig pkgconf
	mkdir -p $(HOME)/workspace/projects/repositories/logiops
	git clone https://github.com/PixlOne/logiops.git projects/repositories/logiops
	mkdir -p $(HOME)/workspace/projects/repositories/logiops/build
	(cd $(HOME)/workspace/projects/repositories/logiops/build && cmake .. && make)
	(cd $(HOME)/workspace/projects/repositories/logiops/build && sudo make install)
	sudo systemctl enable --now logid

setup-k2:
	@echo "https://github.com/adam-savard/keyboard-function-keys-linux"
	sudo cp $(HOME)/workspace/installation/arch/extras/keychron.service /etc/systemd/system/
	sudo systemctl enable --now keychron

setup-login-manager:
	@echo "Enable gdm"
	sudo systemctl enable gdm
	sudo systemctl start gdm

setup-gnome: stow-config
	@echo "Gnome requires unique user"
	./01-gnome.sh
