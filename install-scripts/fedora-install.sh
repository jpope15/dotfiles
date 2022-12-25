#!/bin/bash

# This will install all fedora packages using the dnf pacakge manager
# Tested on Fedora 37.

packages_list=(
	alacritty
	btop
	cmake
	gcc
	ffmpeg-libs
	npm
	ocaml
	perf
	valgrind
	yadm
)

# First, enabling the RPM fusion free library.
sudo dnf install \
  https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm

#Installing all the libraries listed in the packages_list list.
sudo dnf -y install ${packages_list[*]}

# Cloning my dotfiles repo now that all packages are installed.
yadm clone https://github.com/jpope15/dotfiles.git
