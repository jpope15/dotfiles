#!/bin/bash

# Installing all the pacakges using another script I made.
packages/install-pacakges.sh

# Enabling the RPM fusion free library.
sudo dnf install \
  https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm

#Installing all the libraries listed in the packages_list list.
sudo dnf -y install ${packages_list[*]}

# Cloning my dotfiles repo now that all packages are installed.
yadm clone https://github.com/jpope15/dotfiles.git

# Setting up nvim using lazy.nvim
nvim --headless "+Lazy! sync" +qa
