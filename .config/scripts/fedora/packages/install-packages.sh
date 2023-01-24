#!/bin/bash

# This will install all packages in the packages.txt file
config_file=~/.config/scripts/fedora/packages/fedora-install-packages.txt

while read -r line; do
    sudo dnf install -y $line
done < $config_file 
