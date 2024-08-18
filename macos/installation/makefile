
# Makefile

checkmark=\xE2\x9C\x94  # Unicode character representation
warning=\xE2\x9A\xA0  # Unicode character representation

define warn
	@tput bold
	@tput setaf 3
	@printf "${warning}${1}\n"
	@tput sgr0
endef

define log
	@tput bold
	@tput setaf 6
	@printf "${checkmark}${1}\n"
	@tput sgr0
endef

.DEFAULT_GOAL := help
ROOT_DIR := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
OS := $(shell uname -s)
SDKMAN := $(HOME)/.sdkman/bin/sdkman-init.sh

###############################################################################
# Default
###############################################################################

.PHONY: help
help:
	@echo "|> Directory: ${ROOT_DIR}"
	@echo "|> OS: ${OS}"
	@echo "|> Available targets:"
	@make -qpRr | grep -E '^[a-z].*:$$' | sed -e 's~:~~g' | sort

.PHONY: all
all: install pynvim-install pipx-install stow-setup
	@$(call warn, all)

.PHONY: install
install: brew-install brew-setup zsh-setup macos-defaults
	@$(call warn, install)

.PHONY: update
update: brew-setup zimfw-refresh
	@$(call warn, update)

.PHONY: test
test:
	@$(call warn, test)

.PHONY: clean
clean:
	@$(call warn, clean)

###############################################################################
# Brew
###############################################################################

.PHONY: brew-install
brew-install:
	@$(call warn, install brew)
	bash brew-install.sh
	@$(call log, brew)

.PHONY: brew-setup
brew-setup:
	@$(call warn, run brewfile)
	brew bundle --file brew/Brewfile
	@$(call log, brewfile)

###############################################################################
# Macos defaults
###############################################################################

.PHONY: macos-defaults
macos-defaults:
	@$(call warn, macos defaults)
	bash macos-defaults.sh
	@$(call log, macos)

###############################################################################
# Zsh
###############################################################################

.PHONY: zsh-setup
zsh-setup:
	@$(call warn, install zsh)
	./01-zsh.sh
	@$(call log, zsh)

###############################################################################
# Stow
###############################################################################

.PHONY: stow-setup
stow-setup: neovim-submodule ranger-submodules
	@$(call warn , run stow - WIP)
	mkdir -p $(HOME)/.config
	mkdir -p $(HOME)/.cache/zsh
	exec stow --restow --verbose --dir=$(HOME)/workspace --target=$(HOME) neovim
	exec stow --restow --verbose --dir=$(HOME)/workspace --target=$(HOME) zsh
	exec stow --restow --verbose --dir=$(HOME)/workspace --target=$(HOME) base
	exec stow --restow --verbose --dir=$(HOME)/workspace/macos --target=$(HOME) dotfiles
	@$(call log, stow)

###############################################################################
# Sdkman
###############################################################################

.PHONY: sdkman-setup
sdkman-setup:
	@$(call warn, installing sdkman and java related packages)
	@$(call warn, high chance the package installation does not succeed)
	@$(call warn, look into 02-sdkman.zsh)
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

	@$(call log, sdkman)
	@$(call log, java koltin scala groovy gradle maven")

###############################################################################
# Python
###############################################################################

.PHONY: pipx-install
pipx-install:
	@$(call warn, installing pipx packages)
	pipx install poetry
	pipx inject poetry poetry-plugin-export
	pipx install commitizen
	pipx ensurepath
	@$(call log, pipx)

.PHONY: pynvim-install
pynvim-install:
	@$(call warn, installing pynvim)
	python3 -m pip install --user --upgrade pynvim
	@$(call log, pynvim)

###############################################################################
# Zimfw
###############################################################################

.PHONY: zimfw-refresh
zimfw-refresh:
	@$(call warn, zimfw)
	zsh -ic 'zimfw upgrade'
	zsh -ic 'zimfw update'
	@$(call log, zimfw)

###############################################################################
# Gitmodules
###############################################################################

.PHONY: ranger-submodules
ranger-submodules:
	@$(call warn, initializing ranger submodules)
	git submodule update --init $(HOME)/workspace/base/.config/ranger/plugins/ranger-zoxide
	git submodule update --init $(HOME)/workspace/base/.config/ranger/plugins/ranger-devicons2
	@$(call log, ranger submodules)

.PHONY: neovim-submodule
neovim-submodule:
	@$(call warn, initializing neovim submodule)
	git submodule update --init $(HOME)/workspace/neovim
	@$(call log, neovim submodule)
