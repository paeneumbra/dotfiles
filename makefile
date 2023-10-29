# Makefile

OS := $(shell uname -s)

# Workspace setup
setup-repos:
	@echo "Requires ssh configured in github"
	./bin/cloneworkspace.py -s ./workspace.json -r

update-workspace-repos:
	python3 ./bin/updategitrepos.py --workspace -r

start-k2:
ifeq ($(OS),Darwin)
	@echo "Not available for macos"
else
	@echo "Enable fn keys in keychron k2"
	sudo systemctl start keychron
endif

# MacOS/Linux system update
update-system:
ifeq ($(OS), Darwin)
	@echo "Updating MacOS packages"
	brew bundle --file $(HOME)/workspace/installation/macos/brew/Brewfile
else
	@echo "Updating Linux packages"
	yay -Syu --noconfirm
endif

# Repository helpers
pre-commit: setup-pre-commit update-pre-commit

setup-pre-commit:
	pre-commit install

update-pre-commit:
	pre-commit autoupdate

bump:
	cz bump
	git push --tags
