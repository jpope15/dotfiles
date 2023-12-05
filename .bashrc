# .bashrc
# my bash rc file
# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Bash aliases file
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Set default editor to nvim
export EDITOR="/usr/bin/nvim"

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

#updating path to add lsps
export PATH=$PATH:$HOME/.local/share/nvim/mason/bin

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc

[ -f "/home/jamespope/.ghcup/env" ] && source "/home/jamespope/.ghcup/env" # ghcup-env


function rm() {
    local BLACKLISTED_DIRECTORIES=("/home/jamespope", "/home/jamespope/.config") 
    local CURRENT_DIRECTORY=$(pwd)

    # Check if the current directory is blacklisted
    if [[ " ${BLACKLISTED_DIRECTORIES[@]} " =~ " ${CURRENT_DIRECTORY} " ]]; then
        # Parse the arguments to check for '-rf' and '*'
        local has_rf=0
        local has_star=0
        for arg in "$@"; do
            if [[ "$arg" == "-rf" ]]; then
                has_rf=1
            fi
            if [[ "$arg" == "*" ]]; then
                has_star=1
            fi
        done

        # If both '-rf' and '*' are present in the arguments
        if [[ $has_rf -eq 1 && $has_star -eq 1 ]]; then
            echo "You dumb bitch look at what directory you are in" 
            return 1 # Exit the function with an error status
        fi
    fi

    # If not blacklisted or not a dangerous command, proceed with the normal rm command
    command rm "$@"
}

export -f rm
