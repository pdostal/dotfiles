#export SHELL=/bin/bash
#export PS1="\u@\h:\w $ "
export PS1="\[\033[0;32m\]\u\[\033[0;33m\]@\[\033[0;34m\]\h\[\033[0;35m\]:\[\033[0;31m\]\w \[\033[0;36m\]$\[\033[0;37m\] "
export EDITOR="vim"

export CLICOLOR=1
export LSCOLORS=Exfxcxdxbxegedabagacad
export GREP_OPTIONS='--color=auto'

unset MAILCHECK

export PATH=~/bin/:/usr/local/bin/:$PATH

case $TERM in
    xterm*)
        echo -ne "\033]0;"$USER@$HOSTNAME"\007"
        ;;
esac

alias ls='ls -F'
alias la='ls -laF'
alias rmr='rm -rf'
alias rs='rsync -av --delete'
alias sudo='sudo '

if [ -f ~/.bashpath ]; then
	source ~/.bashpath
fi
