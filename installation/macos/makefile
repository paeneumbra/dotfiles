# Makefile
.DEFAULT_GOAL := help

SDKMAN := $(HOME)/.sdkman/bin/sdkman-init.sh

define print-header
@echo "\033[0;33m\xE2\x9A\xA0 initiating "${1}"\033[0m"
endef

define print-footer
@echo "\033[0;32m\xE2\x9C\x94"${1}"\033[0m"
endef

GREEN='\033[0;32m'  # ANSI escape code for green color
RESET='\033[0m'     # ANSI escape code to reset color

text="\xE2\x9C\x94"  # Unicode character representation

help:
	@echo 'Available make targets:'
	@grep '^[^#[:space:]].*:' Makefile

.PHONY: setup
setup: brew-install git-submodules-setup brew-setup stow-setup poetry-install pynvim-install macos-defaults sdkman-setup
	pre-commit install
	@$(call print-footer, "setup was successful")

.PHONY: brew-install
brew-install:
	@$(call print-header,"brew")
	bash brew-install.sh
	@$(call print-footer, "brew")

.PHONY: git-submodules-setup
git-submodules-setup:
	@$(call print-header,"git submodules")
	git submodule init
	git submodule update
	@$(call print-footer,"git submodules")

.PHONY: brew-setup
brew-setup:
	@$(call print-header,"brewfile")
	brew bundle --file brew/Brewfile
	@$(call print-footer, "brewfile")

.PHONY: stow-setup
stow-setup:
	@$(call print-header,"stow")
	mkdir -p $(HOME)/.config
	mkdir -p $(HOME)/.cache/zsh
	exec stow --restow --verbose --dir=$(HOME)/workspace --target=$(HOME) neovim
	exec stow --restow --verbose --dir=$(HOME)/workspace --target=$(HOME) terminal
	exec stow --restow --verbose --dir=$(HOME)/workspace --target=$(HOME) macos

	@$(call print-footer, "stow")

.PHONY: sdkman-setup
sdkman-setup:
	@$(call print-header,"sdkman")
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

	@$(call print-footer, "sdkman")
	@$(call print-footer, "java koltin scala groovy gradle maven")

.PHONY: macos-defaults
macos-defaults:
	@$(call print-header,"osx defaults")
	bash macos-defaults.sh
	@$(call print-footer, "osx defaults")

.PHONY: pipx-install
pipx-install:
	@$(call print-header,"install pipx packages")
	pipx install poetry
	pipx inject poetry poetry-plugin-export
	pipx install commitizen
	@$(call print-footer, "poetry, commitizen installed")

.PHONY: pynvim-install
pynvim-install:
	@$(call print-header,"pynvim")
	python3 -m pip install --user --upgrade pynvim
	@$(call print-footer, "pynvim")
