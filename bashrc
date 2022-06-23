export MM_CHARSET=utf8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_TIME=”en_US.UTF-8
export LC_COLLATE=”en_US.UTF-8″
export LC_NUMERIC=”en_US.UTF-8″
export LC_MONETARY=”en_US.UTF-8″
export LC_MESSAGES=”en_US.UTF-8″

export GPG_TTY=$(tty)

if [ -z "$PS1" ]; then
  return
fi

# Based on: https://github.com/jimeh/git-aware-prompt
find_git_branch() {
  # Based on: http://stackoverflow.com/a/13003854/170413
  local branch
  if branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null); then
    if [[ "$branch" == "HEAD" ]]; then
      branch=' detached*'
    fi
    git_branch=" $branch"
  else
    git_branch=""
  fi
}
find_git_tag() {
  local tag
  if tag=$(git describe --abbrev=0 --tags 2> /dev/null); then
    git_tag=":$tag"
  else
    git_tag=""
  fi
}
find_git_dirty() {
  local status=$(git status --porcelain 2> /dev/null)
  if [[ "$status" != "" ]]; then
    git_dirty="'"
  else
    git_dirty=""
  fi
}

if [ -d ~/external/kube-ps1/ ]; then
  source ~/external/kube-ps1/kube-ps1.sh
  KUBE_PS1_SYMBOL_ENABLE=false
  KUBE_PS1_PREFIX=' '
  KUBE_PS1_SUFFIX=''
else
  alias kube_ps1=echo
fi

PROMPT_COMMAND="find_git_branch; find_git_tag; find_git_dirty; $PROMPT_COMMAND"

if [ "$myPrimaryDevice" == 1 ]; then
  export PS1="\[\e]0;local: \w\a\007\]\h:\w\$git_branch\$git_tag\$git_dirty\$(kube_ps1)$ "
else
  export PS1="\[\e]0;\h: \w\a\007\]\u@\h:\w\$git_branch\$git_tag\$git_dirty\$(kube_ps1)$ "
fi

export EDITOR="vim"

export CLICOLOR=1
export LSCOLORS=Exfxcxdxbxegedabagacad

unset MAILCHECK

export PATH=./bin:~/bin:/usr/local/sbin:$PATH

HISTSIZE=10000
HISTFILESIZE=1000000
shopt -s histappend
#export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

if hash rbenv 2>/dev/null ; then
  eval "$(rbenv init -)"
fi

if hash fasd 2>/dev/null ; then
  fasd_cache="$HOME/.fasd-init-bash"
  if [ hash fasd 2>/dev/null && "$(command -v fasd)" -nt "$fasd_cache" -o ! -s "$fasd_cache" ]; then
    fasd --init posix-alias bash-hook bash-ccomp bash-ccomp-install >| "$fasd_cache"
  fi
  source "$fasd_cache"
  unset fasd_cache
fi


SSH_ENV="$HOME/.ssh/environment"
function start_agent {
  echo '' > $SSH_ENV
  chmod 600 $SSH_ENV
  ssh-agent >> $SSH_ENV
  source $SSH_ENV > /dev/null
  echo "The SSH agent runs as ${SSH_AGENT_PID} ."
  ssh-add
}

if [ -f "${SSH_ENV}" ]; then
  . "${SSH_ENV}" > /dev/null
  if ! ps -p $SSH_AGENT_PID > /dev/null; then
    echo "Process ${SSH_AGENT_PID} is dead."
    start_agent
  else
    echo "The SSH agent runs as ${SSH_AGENT_PID} ."
  fi
else
  echo "File ${SSH_ENV} does not exist yet."
  start_agent
fi

if [ -d "/usr/local/bin" ]; then
  export PATH="/usr/local/bin:$PATH"
fi
if [ -d "~/bin" ]; then
  export PATH="~/bin:$PATH"
fi

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

