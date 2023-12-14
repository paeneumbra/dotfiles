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
	@echo 'Now run the following commands'
	@echo 'sdk install java'
	@echo 'sdk install kotlin'
	@echo 'sdk install scala'
	@echo 'sdk install groovy'
	@echo 'sdk install gradle'
	@echo 'sdk install maven'
