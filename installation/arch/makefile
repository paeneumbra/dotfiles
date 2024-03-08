# Makefile
.DEFAULT_GOAL := help

SDKMAN := $(HOME)/.sdkman/bin/sdkman-init.sh

base-setup:
	./00-base.sh

yay-setup:
	mkdir -p $(HOME)/projects/repositories/yay
	git clone https://aur.archlinux.org/yay.git projects/repositories/yay
	(cd $(HOME)/projects/repositories/yay && makepkg -si)

awesomewm-setup:
	./01-awesomewm.sh

extra-setup:
	./02-extras.sh

development-setup:
	./03-development.sh
	./05-pipx.sh

stow-setup:
	mkdir -p $(HOME)/.config/gtk-3.0
	exec stow --verbose --dir=$(HOME)/workspace/dotfiles --target=$(HOME) common
	exec stow --verbose --dir=$(HOME)/workspace/dotfiles --target=$(HOME) archlinux
	exec stow --verbose --dir=$(HOME)/workspace --target=$(HOME) neovim

zsh-setup:
	mkdir -p $(HOME)/.cache/zsh
	chsh -s $$(which zsh)
	sudo chsh -s $$(which zsh)
	@echo "Restart to enable zsh"

audio-setup:
	./04-audio.sh
	systemctl --user enable --now pipewire
	systemctl --user enable --now pipewire
	systemctl --user enable --now wireplumber
	sudo systemctl enable --now bluetooth.service

gaming-setup:
	./08-games.sh

productivity-setup:
	./06-productivity.sh

git-submodules-init:
	@echo "Requires ssh configured in github"
	git submodule init
	git submodule update

repository-setup:
	@echo "Requires ssh configured in github"
	$(HOME)/workspace/bin/cloneworkspace.py -s ./workspace.json -r

mimelist-copy:
	cp $(HOME)/workspace/installation/arch/extras/mimeapps.list $(HOME)/.config

logiops-setup:
	sudo pacman -S cmake libevdev libconfig pkgconf
	mkdir -p $(HOME)/workspace/projects/repositories/logiops
	git clone https://github.com/PixlOne/logiops.git projects/repositories/logiops
	mkdir -p $(HOME)/workspace/projects/repositories/logiops/build
	(cd $(HOME)/workspace/projects/repositories/logiops/build && cmake .. && make)
	(cd $(HOME)/workspace/projects/repositories/logiops/build && sudo make install)
	sudo systemctl enable --now logid

k2-setup:
	@echo "https://github.com/adam-savard/keyboard-function-keys-linux"
	sudo cp $(HOME)/workspace/installation/arch/extras/keychron.service /etc/systemd/system/
	sudo systemctl enable --now keychron

login-manager-setup:
	@echo "Enable gdm"
	sudo systemctl enable gdm
	sudo systemctl start gdm

gnome-setup: stow-setup
	@echo "Gnome requires unique user"
	./01-gnome.sh

sdkman-setup:
	@. $(SDKMAN)
ifndef SDKMAN_DIR
	@curl -Ss "https://get.sdkman.io" | bash
	@source $(SDKMAN)
	ifndef SDKMAN_DIR
		SDKMAN_EXISTS := @echo "SDKMAN_VERSION is undefined" && exit 1
	endif
endif

	@. $(SDKMAN) && echo N | sdk install java
	@. $(SDKMAN) && echo N | sdk install kotlin
	@. $(SDKMAN) && echo N | sdk install scala
	@. $(SDKMAN) && echo N | sdk install groovy
	@. $(SDKMAN) && echo N | sdk install gradle
	@. $(SDKMAN) && echo N | sdk install maven

	@printf "\xE2\x9C\x94 "
	@printf "sdkman"
	@printf "\n"
