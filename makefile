# Makefile

define print-header
@echo "\033[0;33m\xE2\x9A\xA0 initiating "${1}"\033[0m"
endef

OS := $(shell uname -s)

# Workspace setup
repositories-update:
	@echo "Requires ssh configured in github"
	./bin/cloneworkspace.py -s ./workspace.json -r

workspace-repositories-update:
	python3 ./bin/updategitrepos.py --workspace -r

k2-start:
ifeq ($(OS),Darwin)
	@echo "Not available for macos"
else
	@echo "Enable fn keys in keychron k2"
	sudo systemctl start keychron
endif

# MacOS/Linux system update
system-update:
ifeq ($(OS), Darwin)
	@$(call print-header,"Updating osx packages via brewfile")
	brew bundle --file $(HOME)/workspace/installation/macos/brew/Brewfile
else
	@$(call print-header,"Updating archlinux packages via yay")
	yay -Syu --noconfirm
endif

# Repository helpers
pre-commit: pre-commit-setup pre-commit-update

pre-commit-setup:
	pre-commit install

pre-commit-update:
	pre-commit autoupdate

bump:
	cz bump
