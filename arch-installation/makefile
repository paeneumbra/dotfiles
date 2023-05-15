# Makefile

setup-logiops:
	sudo pacman -S cmake libevdev libconfig pkgconf
	mkdir -p projects/repositories/logiops
	git clone https://github.com/PixlOne/logiops.git projects/repositories/logiops
	mkdir -p projects/repositories/logiops/build
	(cd projects/repositories/logiops/build && cmake .. && make)
	(cd projects/repositories/logiops/build && sudo make install)
	sudo systemctl enable --now logid

setup-k2:
	echo "https://github.com/adam-savard/keyboard-function-keys-linux"
	sudo cp ./extras/keychron.service /etc/systemd/system/
	sudo systemctl enable --now keychron
	
