#!/bin/bash

# This will install all pacakges in the packages.txt file
config_file='fedora-install-pacakges.txt'

while read -r line; do
    sudo dnf install -y $line
done < $config_file 
