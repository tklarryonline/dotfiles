### ENV vars
DOTFILES=$HOME/dotfiles

# Give a welcome message
echo "Welcome"
cat $DOTFILES/art
echo "The Awesomeness has just begun...\n"

# Path to your oh-my-zsh configuration.
ZSH=$DOTFILES/.oh-my-zsh

# Path to my custom folders
ZSH_CUSTOM=$DOTFILES/oh-my-zsh-custom

# I will use my own theme!
ZSH_THEME="tklarry"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed 
# while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? 
# (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

### My own aliases
# ll aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
# cd aliases
alias cd1='cd ..'
alias cd2='cd ../..'
alias cd3='cd ../../..'
alias cd4='cd ../../../..'
alias cd5='cd ../../../../..'
alias back='cd -'
# link aliases
alias slink='ln -s'
# xsel aliases
alias xselclip='xsel --clipboard'
# make aliases
alias makelog='make >&log'
# sudo aliases
alias suvim='sudo vim'
# important dir aliases
alias ohmyzsh="cd $DOTFILES/.oh-my-zsh"
alias dotfiles="cd $DOTFILES"
# config aliases
alias zshrc='vim ~/.zshrc'
alias zshtheme="vim $DOTFILES/oh-my-zsh-custom/tklarry.zsh-theme"
alias zshreload='clear && source ~/.zshrc'
alias vimrc='vim ~/.vimrc'
alias gitconf='vim ~/.gitconfig'
# other aliases
alias cl='clear'

### Exports
export TERM='xterm-256color'
export EDITOR=vim

### Some conditions
# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ]; then
	[ -e "$HOME/.dircolors" ] && DIR_COLORS="$HOME/.dircolors"
	[ -e "$DIR_COLORS" ] || DIR_COLORS=""
	eval "`dircolors -b $DIR_COLORS`"
	alias ls='ls --color=auto'
	alias dir='ls --color=auto --format=vertical'
	alias vdir='ls --color=auto --format=long'
fi

### My own functions
#
# mkgo - mkdir + cd
mkgo() {
	mkdir $1 && cd $1
}


