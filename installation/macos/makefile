# Makefile
.DEFAULT_GOAL := help

SDKMAN := $(HOME)/.sdkman/bin/sdkman-init.sh

help:
	@echo 'Available make targets:'
	@grep '^[^#[:space:]].*:' Makefile

setup: git-submodules-init stow-update bundle-update
	pre-commit install

bundle-update: pynvim-install
	brew bundle --file brew/Brewfile

stow-update:
	mkdir -p $(HOME)/.config
	mkdir -p $(HOME)/.cache/zsh
	exec stow --restow --verbose --dir=$(HOME)/workspace/dotfiles --target=$(HOME) common
	exec stow --restow --verbose --dir=$(HOME)/workspace/dotfiles --target=$(HOME) macos

git-submodules-init:
	git submodule init
	git submodule update

pynvim-install:
	python3 -m pip install --user --upgrade pynvim

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
