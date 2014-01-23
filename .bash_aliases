# ~/.bash_aliases

if [ `uname -s` == "Darwin" ] || [ `uname -s` == "FreeBSD" ]; then
  alias ls='ls -FG'
else
  alias ls='ls -F --color=auto'
fi

alias ll='ls -l'
alias la='ls -A'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias sc='script_rails console'
alias ss='script_rails server -u'
alias sdbc='script_rails dbconsole -p'

alias gb='git branch'
alias gc='git commit -v'
alias gca='git commit -a -v'
alias gco="git checkout"
alias gd='git diff'
alias gdc='git diff --cached'
alias gdh='git diff HEAD'
alias gp='git push'
alias gl='git pull'
alias gpr='git pull --rebase'
alias gst='git status'
alias gap='git add -p'
