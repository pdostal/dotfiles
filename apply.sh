#!/bin/sh
makelink() {
	echo "$3\t$2";
	rm -f $2;
	ln -f $1 $2;
	chown -f $USER:$USER $2;
	chmod -f $3 $2;
}
# ssh
makelink $HOME/cfg/authorized_keys $HOME/.ssh/authorized_keys 700
makelink $HOME/cfg/ssh_config $HOME/.ssh/config 700
# bash
makelink $HOME/cfg/bashrc $HOME/.bashrc 770
# vim
makelink $HOME/cfg/vimrc $HOME/.vimrc 750
# git
makelink $HOME/cfg/gitconfig $HOME/.gitconfig 750
# htop
makelink $HOME/cfg/htoprc $HOME/.htoprc 750
