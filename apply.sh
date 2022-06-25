#!/bin/sh

copydir() {
  echo "# $3  $1/";
  if [ ! -d $1/../ ]; then
    mkdir -p "$(dirname $1/../)"
  fi
  rm -rf $1;
  cp -R $2 $1;
  chown -Rf $USER $1;
  chmod -Rf $3 $1;
}

copyone() {
  echo "@ $3  $1";
  if [ ! -f $1 ]; then
    mkdir -p "$(dirname $1)"
  fi
  rm -rf $1;
  cp $2 $1;
  chown -Rf $USER $1;
  chmod -Rf $3 $1;
}

copytwo() {
  echo "       $1_secret";
  if [ -f $2 ]; then
    cat $2 1>> $1;
  fi
}

# bash
copyone $1/.bashrc $2/bashrc 770
copytwo $1/.bashrc $2/bashrc_secret
# vim
copydir $1/.vim $2/vim 775
# git
copyone $1/.gitconfig $2/gitconfig 750
copytwo $1/.gitconfig $2/gitconfig_secret
# htop
copyone $1/.htoprc $2/htoprc 750
# ssh
copyone $1/.ssh/config $2/sshconfig 700
copytwo $1/.ssh/config $2/sshconfig_secret
# gem
copyone $1/.gemrc $2/gemrc 755
# gpg
copyone $1/.gnupg/gpg-agent.conf $2/gpg-agent.conf 755
copyone $1/.gnupg/gpg.conf $2/gpg.conf 755
# tmux
copyone $1/.tmux.conf $2/tmux.conf 744
copytwo $1/.tmux.conf $2/tmux_secret.conf
# ansible
copyone $1/.ansible.cfg $2/ansible.cfg 744

# tmuxinator
for filename in $2/tmuxinator/*; do
  secretname=$(basename "$filename")
  localname=$(echo "$secretname" | sed 's/_secret//' )
  copyone $1/.tmuxinator/$localname $2/tmuxinator/$secretname 744
done

