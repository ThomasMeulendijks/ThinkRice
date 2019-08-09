#!/bin/sh

# Profile file. Runs on login.

export PATH="$PATH:$HOME/.scripts"
export PATH="$PATH:$(ruby -e 'puts Gem.user_dir')/bin"
export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="firefox"
export READER="zathura"
#export BIB="$HOME/Documents/LaTeX/uni.bib"

. ~/.scripts/shortcuts.sh 2>/dev/null

[[ -f ~/.bashrc ]] && . ~/.bashrc

if [ -z "$SSH_AUTH_SOCK" ] ; then
  eval "$(ssh-agent -s)"
fi

# Start graphical server if i3 not already running.
if [[ "$(tty)" = "/dev/tty1" ]]; then
	pgrep -x dwm || exec startx /usr/local/bin/dwm
fi
if [[ "$(tty)" = "/dev/tty2" ]]; then
	pgrep -x i3 || exec startx 
fi
