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

OS := $(shell uname -s)

.PHONY: init
init:
	@$(call warn, Init submodules - requires git ssh configuration)
	git submodule init
	git submodule update
	@$(call log, Submodules initialized)

.PHONY: workspace-clone
workspace-clone:
	@$(call warn, Cloning workspace repositories)
	./bin/cloneworkspace.py -s ./workspace.json -r
	@$(call log, Cloning successfull)

.PHONY: workspace-git-update
workspace-git-update:
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

system-update:
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
	@$(call warn, restow)
	exec stow --restow --verbose --dir=$(HOME)/workspace --target=$(HOME) neovim
	exec stow --restow --verbose --dir=$(HOME)/workspace --target=$(HOME) terminal
ifeq ($(OS), Darwin)
	exec stow --restow --verbose --dir=$(HOME)/workspace --target=$(HOME) macos
else
	exec stow --restow --verbose --dir=$(HOME)/workspace --target=$(HOME) arch
	@$(call warn, run distribution specific stow for linux!)
endif
	@$(call log, restow)

.PHONY: awestow
awestow: restow
	@$(call warn, awesome stow)
	exec stow --restow --verbose --dir=$(HOME)/workspace --target=$(HOME) awesome
	@$(call log, awesome stow)

.PHONY: qtstow
qtstow: restow
	@$(call warn, awesome stow)
	exec stow --restow --verbose --dir=$(HOME)/workspace --target=$(HOME) qtile
	@$(call log, awesome stow)

# Repository helpers
pre-commit: pre-commit-setup pre-commit-update

pre-commit-setup:
	pre-commit install

pre-commit-update:
	pre-commit autoupdate

bump:
	cz bump
