# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash if ~/.bash_profile or ~/.bash_login
# exists.
#
# see /usr/share/doc/bash/examples/startup-files for examples.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
# umask 022

# -- .
# -- personnal - defaults.
export TERM=xterm-256color

# -- personnal - clean random .dot files.
export LESSHISTFILE=/dev/null  # -- .lesshst search history file
alias wget='wget --hsts-file=$HOME/.cache/wget-hsts'

# -- personnal - enable colors
alias ls='ls --color=auto'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# -- personnal - git prompt
. ~/.local/dotfiles/.profile.git-prompt.sh

# -- personnal - env
# -- https://stackoverflow.com/questions/50427449/behavior-of-arrays-in-bash-and-zsh
ENVS=($HOME/.local/bin/env $HOME/.local/bin/env.*)
for env in "${ENVS[@]}" ; do
  . "$env"
done

