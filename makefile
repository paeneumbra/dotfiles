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
DISTRO := $(XDG_CURRENT_DESKTOP)
VENV := .venv

###############################################################################
# Default
###############################################################################

.PHONY: help
help:
	@echo "\n|> Directory: ${ROOT_DIR}"
	@echo "|> OS: ${OS}"
	@echo "|> Available targets:\n"
	@make -qpRr | egrep -e '^[a-z].*:$$' | sed -e 's~:~~g' | sort

.PHONY: all
all: clean poetry-install pre-commit
	@$(call warn, init config)

.PHONY: test
test: poetry-test

.PHONY: clean
clean: python-delete-venv

###############################################################################
# Setup
###############################################################################

.PHONY: init
init:
	@$(call warn, DEPRECATED - modules should be initiated as needed!)
	@$(call warn, WIP - initiate neovim and ranger or leave it to the installation)

.PHONY: workspace-clone
workspace-clone:
	@$(call warn, DEPRECATED - projects is being deprecated in favour of depository)
	@$(call warn, Cloning workspace repositories)
	./bin/cloneworkspace.py -s ./workspace.json -r
	@$(call log, Cloning successfull)

.PHONY: workspace-git-update
workspace-git-update:
	@$(call warn, DEPRECATED - projects is being deprecated in favour of depository)
	@$(call warn, Update workspace repositories)
	@./bin/updategitrepos.py \
		--workspace \
		--ignore /home/archy/workspace/projects/archived /home/archy/workspace/projects/demos/ \
		-r
	@$(call log, Workspace git repositories successfully updated)

.PHONY: k2-start
k2-start:
ifeq ($(OS),Darwin)
	@$(call warn, Not for macos!)
else
	@$(call warn, Enabling keychron fn keys!)
	sudo systemctl start keychron
endif

system-update: zimfw-refresh
ifeq ($(OS), Darwin)
	@$(call warn, Updating osx packages via brewfile)
	brew bundle --file $(HOME)/workspace/installation/macos/brew/Brewfile
	@$(call log, system update)
else
	@$(call warn, Updating archlinux packages via pacman/yay)
	yay -Syu --noconfirm
	@$(call log, system update)
endif

.PHONY: restow
restow:
	@$(call warn, restow - WIP)
	exec stow --restow --verbose --dir=$(HOME)/workspace --target=$(HOME) neovim
	exec stow --restow --verbose --dir=$(HOME)/workspace --target=$(HOME) zsh
	exec stow --restow --verbose --dir=$(HOME)/workspace --target=$(HOME) base
ifeq ($(OS), Darwin)
	exec stow --restow --verbose --dir=$(HOME)/workspace --target=$(HOME) macos
endif
	@$(call log, restow)

.PHONY: restow-awesome
restow-awesome:
	@$(call warn, awesome)
	exec stow --restow --verbose --dir=$(HOME)/workspace/linux --target=$(HOME) dotfiles
	exec stow --restow --verbose --dir=$(HOME)/workspace/linux --target=$(HOME) awesome

.PHONY: restow-qtile
restow-qtile:
	@$(call warn, qtile)
	exec stow --restow --verbose --dir=$(HOME)/workspace/linux --target=$(HOME) dotfiles
	exec stow --restow --verbose --dir=$(HOME)/workspace/linux --target=$(HOME) qtile


# Zimfw
.PHONY: zimfw-refresh
zimfw-refresh:
	@$(call warn, zimfw)
	zsh -ic 'zimfw upgrade'
	zsh -ic 'zimfw update'
	@$(call log, zimfw)

###############################################################################
# Poetry setup and help
###############################################################################

.PHONY: poetry-setup
poetry-setup: poetry-local-venv python-delete-venv poetry-install

.PHONY: poetry-setup
poetry-install:
	@$(call warn, create and install poetry dependencies)
	poetry install
	@$(call log, create and install poetry dependencies)

python-delete-venv:
	@$(call warn, delete existent virtualenv)
	rm -rf $(VENV)
	rm -rf venv
	@$(call log, delete existent virtualenv)

poetry-local-venv:
	@$(call warn, setting virtualenv location to project)
	poetry config virtualenvs.in-project true
	@$(call log, virtualenv set to project location)

poetry-get-env:
	poetry env info --path

poetry-update:
	@$(call warn, update poetry dependencies)
	poetry update
	poetry self update
	@$(call log, poetry dependencies update)

poetry-test:
	@$(call warn, run tests with poetry)
	poetry run pytest
	@$(call log, tests done)

###############################################################################
# Pre commit
###############################################################################

pre-commit: pre-commit-setup pre-commit-update

pre-commit-setup:
	@$(call warn, install pre-commit dependencies)
	pre-commit install
	@$(call log, install pre-commit dependencies)

pre-commit-update:
	@$(call warn, update pre-commit dependencies)
	pre-commit autoupdate
	@$(call log, update pre-commit dependencies)

###############################################################################
# Commitizen
###############################################################################

bump:
	@$(call warn, bump version of commitizen)
	cz bump
	@$(call log, Dont forget to push the tags)
	@$(call log, git push --tags)

###############################################################################
# Tools
###############################################################################

.PHONY: update
update: pre-commit-update poetry-update
