#!/bin/bash

printf "Installing packages........\n"
sudo xbps-install xorg-minimal xterm xorg-fonts xrandr twm gmp-devel libX11-devel libXrandr-devel pkg-config libXft-devel libXScrnSaver-devel xz make gcc zlib-devel stack
sudo ln -s /lib/libncurses.so.6.4 /lib/libtinfo.so.6

printf "Setting ~/.local/bin to path........\n"
export PATH="$HOME/.local/bin:$PATH"

printf "Setting and installing xmonad with stack......\n"
stack setup
stack update
stack install stack
stack install xmonad
stack install xmonad-contrib
stack install xmobar
