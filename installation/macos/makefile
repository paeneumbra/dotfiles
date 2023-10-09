# Makefile

VENV = macos-venv
ACTIVATION = $(VENV)/bin/activate

help:
	@echo 'Available make targets:'
	@grep '^[^#[:space:]].*:' Makefile

bundle: pynvim
	brew bundle --file brew/Brewfile

setup: init-submodules stow bundle
	pre-commit install

stow:
	mkdir -p $(HOME)/.config
	exec stow --no --restow --verbose --dir=$(HOME)/workspace --target=$(HOME) sys


init-submodules:
	git submodule init
	git submodule update

pynvim:
	python3 -m pip install --user --upgrade pynvim
