# Makefile

install-base:
	./arch-installation/00-base.sh

setup-yay:
	mkdir -p projects/repositories/yay
	git clone https://aur.archlinux.org/yay.git projects/repositories/yay
	(cd projects/repositories/yay && makepkg -si)

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
	chsh -s $$(wich zsh)
	sudo chsh -s $$(which zsh)
	echo "Restart to enable zsh"

setup-audio:
	./arch-installation/04-audio.sh
	systemctl --user enable --now pipewire
	systemctl --user enable --now pipewire
	systemctl --user enable --now wireplumber
	sudo systemctl enable --now bluetooth.service

setup-gaming:
	./arch-installation/08-games.sh

init-submodules:
	echo "Requires ssh configured in github"
	echo "https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent"
	echo "https://docs.github.com/en/authentication/managing-commit-signature-verification/generating-a-new-gpg-key"
	git submodule init
	git submodule update

setup-repos:
	echo "Requires ssh configured in github"
	./bin/cloneworkspace.py -s ./git/workspace.json -r
	./bin/cloneworkspace.py -s ./git/projects.json -r

update-workspace-repos:
	python3 ./bin/workspaceupdate.py --workspace
