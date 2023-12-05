# Makefile

help:
	@echo 'Available make targets:'
	@grep '^[^#[:space:]].*:' Makefile

bundle: pynvim
	brew bundle --file brew/Brewfile

setup: init-submodules stow bundle
	pre-commit install

stow:
	mkdir -p $(HOME)/.config
	mkdir -p $(HOME)/.cache/zsh
	exec stow --restow --verbose --dir=$(HOME)/workspace/dotfiles --target=$(HOME) common
	exec stow --restow --verbose --dir=$(HOME)/workspace/dotfiles --target=$(HOME) macos

init-submodules:
	git submodule init
	git submodule update

pynvim:
	python3 -m pip install --user --upgrade pynvim

setup-sdkman:
	curl -s "https://get.sdkman.io" | bash
	# source "$(HOME)/.sdkman/bin/sdkman-init.sh"
	# sdk install java
	# sdk install kotlin
	# sdk install scala
	# sdk install groovy
	# sdk install gradle
	# sdk install maven
