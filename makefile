# Makefile

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
	@echo "Updating MacOS packages"
	brew bundle --file $(HOME)/workspace/installation/macos/brew/Brewfile
else
	@echo "Updating Linux packages"
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
