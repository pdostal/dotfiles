#export SHELL=/bin/bash
#export PS1="\u@\h:\w $ "
export PS1="\e[93m\u\e[92m@\e[34m\h\e[95m:\e[96m\w \e[37m$ \e[39m"
export EDITOR="vim"

unset MAILCHECK

case $TERM in
    xterm*)
        echo -ne "\033]0;"$USER@$HOSTNAME"\007"
        ;;
esac

alias ls='ls -F --color=always'
alias la='ls -laF --color=always'
alias rmr='rm -rf'
alias rs='rsync -av --delete'

if [ -f ~/.bashpath ]; then
	source ~/.bashpath
fi
