function ap() { 
    sudo dnf install -y "$@"
    echo "$@" >> ~/install-scripts/fedora/fedora-install-packages.txt; 
} 
