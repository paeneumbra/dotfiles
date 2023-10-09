# Makefile

OS := $(shell uname -s)

setup-repos:
	@echo "Requires ssh configured in github"
	./bin/cloneworkspace.py -s ./workspace.json -r

start-k2:
ifeq ($(OS),Darwin)
	@echo "Not available for macos"
else
	@echo "Enable fn keys in keychron k2"
	sudo systemctl start keychron
endif

bundle:
ifeq ($(OS), Darwin)
	brew bundle --file $(HOME)/workspace/installation/macos/brew/Brewfile
else
	@echo "Only available for macos"
endif

update-workspace-repos:
	python3 ./bin/updategitrepos.py --workspace -r

pre-commit: setup-pre-commit update-pre-commit

setup-pre-commit:
	pre-commit install

update-pre-commit:
	pre-commit autoupdate
