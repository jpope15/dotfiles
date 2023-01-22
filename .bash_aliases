# This function will update a configuration file for installing new packages to automate the dotfile process.
# If the package exists and isn't already installed, then this will install it, update the configuration file,
# and automatically commit and push the changes to github.
#
# Example usage: $ ap cmake 
function ap() {
    local config_file=~/install-scripts/fedora/fedora-install-packages.txt 
    
    # checking if the package exists
    if sudo dnf search "$@" 2>&1 | grep -q "No matches found."; then
        echo "Couldn't install the package. Check if there was a typo or verify the package name."
        return
    fi
   
    # checking if the package is already in the config_file
    if cat $config_file | grep -q "$@"; then
        echo "The package already exists in the configuration file. Not adding to it, but updating the package."
        sudo dnf upgrade -y "$@"
        return
    fi 

    # package does not exist, install and add to config file
    sudo dnf install -y "$@"
    echo "$@" >> $config_file
    
    # automatically updating yadm with the changes.
    yadm add $config_file
    yadm commit -m "Added $@ to the fedora install scripts."
    yadm push
} 
