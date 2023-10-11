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