# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

### Aliases
# ll alias
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
# cd alias
alias cd..='cd ..'
alias cd...='cd ../..'
alias cd....='cd ../../..'
# xsel alias
alias xselclip='xsel --clipboard'


# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# mkgo - Create a Directory and immediately go into it
mkgo() {
  mkdir $1 && cd $1
}

# Colors
       RED="\[\033[0;31m\]"
      PINK="\[\033[1;31m\]"
    YELLOW="\[\033[1;33m\]"
     GREEN="\[\033[0;32m\]"
  LT_GREEN="\[\033[1;32m\]"
      BLUE="\[\033[0;34m\]"
   LT_BLUE="\[\033[1;34m\]"
     WHITE="\[\033[1;37m\]"
    PURPLE="\[\033[1;35m\]"
      CYAN="\[\033[1;36m\]"
     BROWN="\[\033[0;33m\]"
COLOR_NONE="\[\033[0m\]"

# Symbols
LIGHTNING_BOLT="⚡"
      UP_ARROW="↑"
    DOWN_ARROW="↓"
      UD_ARROW="↕"
      FF_ARROW="→"
       RECYCLE="♺"
        MIDDOT="•"
     PLUSMINUS="±"

# have git branch in the terminal
parse_git_branch() {
	branch_pattern="^# On branch ([^${IFS}]*)"
	  remote_pattern_ahead="# Your branch is ahead of"
	  remote_pattern_behind="# Your branch is behind"
	  remote_pattern_ff="# Your branch (.*) can be fast-forwarded."
	  diverge_pattern="# Your branch and (.*) have diverged"

	  git_status="$(git status 2> /dev/null)"
	  if [[ ! ${git_status} =~ ${branch_pattern} ]]; then
	    # Rebasing?
	    toplevel=$(git rev-parse --show-toplevel 2> /dev/null)
	    [[ -z "$toplevel" ]] && return

	    [[ -d "$toplevel/.git/rebase-merge" || -d "$toplevel/.git/rebase-apply" ]] && {
	      sha_file="$toplevel/.git/rebase-merge/stopped-sha"
	      [[ -e "$sha_file" ]] && {
		sha=`cat "${sha_file}"`
	      }
	      echo "$PINK(rebase in progress)$COLOR_NONE ${sha}"
	    }
	    return
	  fi

	  branch=${BASH_REMATCH[1]}

	  # Dirty?
	  if [[ ! ${git_status} =~ "working directory clean" ]]; then
	    [[ ${git_status} =~ "modified:" ]] && {
	      git_is_dirty="$RED$LIGHTNING_BOLT"
	    }

	    [[ ${git_status} =~ "Untracked files" ]] && {
	      git_is_dirty="${git_is_dirty}$WHITE$MIDDOT"
	    }

	    [[ ${git_status} =~ "new file:" ]] && {
	      git_is_dirty="${git_is_dirty}$LT_GREEN+"
	    }

	    [[ ${git_status} =~ "deleted:" ]] && {
	      git_is_dirty="${git_is_dirty}$RED-"
	    }

	    [[ ${git_status} =~ "renamed:" ]] && {
	      git_is_dirty="${git_is_dirty}$YELLOW→"
	    }
	  fi

	  # Are we ahead of, beind, or diverged from the remote?
	  if [[ ${git_status} =~ ${remote_pattern_ahead} ]]; then
	    remote="$YELLOW$UP_ARROW"
	  elif [[ ${git_status} =~ ${remote_pattern_ff} ]]; then
	    remote_ff="$WHITE$FF_ARROW"
	  elif [[ ${git_status} =~ ${remote_pattern_behind} ]]; then
	    remote="$YELLOW$DOWN_ARROW"
	  elif [[ ${git_status} =~ ${diverge_pattern} ]]; then
	    remote="$YELLOW$UD_ARROW"
	  fi

	  echo "${remote}${remote_ff}$GREEN(${branch})$COLOR_NONE${git_is_dirty}$COLOR_NONE"
}

set_prompt() {
	git_prompt="$(parse_git_branch)"
	
	export PS1="\n${debian_chroot:+($debian_chroot)}$LT_GREEN\u@\h$COLOR_NONE:$LT_BLUE\w$COLOR_NONE ${git_prompt}\n$ "
}

export PROMPT_COMMAND=set_prompt

