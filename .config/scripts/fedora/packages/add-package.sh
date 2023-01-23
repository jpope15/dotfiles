#!/bin/bash

# This will update a configuration file for installing new packages to automate the dotfile process.
# If the package exists and isn't already installed, then this will install it, update the configuration file,
# and automatically commit and push the changes to github.
#
# Example usage: $ ap cmake 
config_file=~/.config/scripts/fedora/packages/fedora-install-packages.txt
    
# checking if the package is already in the config_file
if cat $config_file | grep -q "$@"; then
    echo "The package already exists in the configuration file. Not adding to it, but updating the package."
    sudo dnf upgrade -y "$@"
    exit 0 
fi 

# check if pacakge exists, install and add to config file
if sudo dnf install -y "$@" 2>&1 | grep -q "Unable to find a match: $@"; then
    echo "Cound not find the package $@. Double check for any spelling errors."
    exit 0 
fi

echo "$@" >> $config_file
    
# automatically updating yadm with the changes.
yadm add $config_file
yadm commit -m "Added $@ to the fedora install scripts."
yadm push
