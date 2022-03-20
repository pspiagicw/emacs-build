#!/bin/sh

if [[ -d "emacs" ]]
then
	pushd emacs
	make install
	find /usr/share/emacs/ | xargs chown root:root
	mkdir -p /var/games/emacs
	chmod 775 /var/games
	chmod 775 /var/games/emacs
	chown -R root:games /var/games
	popd
fi





