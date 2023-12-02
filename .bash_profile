# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

# opam configuration
test -r /home/jamespope/.opam/opam-init/init.sh && . /home/jamespope/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true
