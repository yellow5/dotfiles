# ~/.bashrc
# vim:set ft=sh sw=2 sts=2:

source "$HOME/.bash_functions"
source "$HOME/.bash_aliases"

# Store 10,000 history entries
export HISTSIZE=10000
# Don't store duplicates
export HISTCONTROL=erasedups
# Append to history file
shopt -s histappend

VISUAL=vim
EDITOR="$VISUAL"
LESS="FRX"
RI="--format ansi -T"

export VISUAL EDITOR LESS RI

bind 'set bind-tty-special-chars off'
bind '"\ep": history-search-backward'
bind '"\en": history-search-forward'
bind '"\C-w": backward-kill-word'

[ -z "$PS1" ] || stty -ixon

[ -z "$PS1" ] || export PS1="\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$(parse_git_branch)$ "

# Enable bash completion in Linux interactive shells
if [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi

# Enable bash completion in OSX interactive shells
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# Enable bash completion in BSD interactive shells
[[ $PS1 && -f /usr/local/share/bash-completion/bash_completion.sh ]] && \
  source /usr/local/share/bash-completion/bash_completion.sh

PATH=$PATH:$HOME/bin             # Add my bin to the PATH
PATH=$PATH:$HOME/.rvm/bin        # Add RVM to PATH for scripting
export PATH

[ ! -f "$HOME/.bashrc.local" ] || . "$HOME/.bashrc.local"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
