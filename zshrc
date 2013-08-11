### ENV vars
DOTFILES=$HOME/dotfiles

# Give a welcome message
# Well, a welcome message is really cheesy...
# Path to your oh-my-zsh configuration.
ZSH=$DOTFILES/.oh-my-zsh

# Path to my custom folders
ZSH_CUSTOM=$DOTFILES/oh-my-zsh-custom

# I will use my own theme!
ZSH_THEME="tklarry"

# Which plugins would you like to load? 
# (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(brew bundler extract gem git pip rails ruby zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

### My own aliases
# ll aliases
alias ll='ls -alhF'
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
# apt aliases
alias apt-ins='sudo apt-get install'
alias apt-unins='sudo apt-get remove'
alias apt-add='sudo add-apt-repository'
alias apt-update='sudo apt-get update'
alias apt-cl='sudo apt-get clean'
alias apt-autorm='sudo apt-get autoremove'
# important dir aliases
alias dotfiles="cd $DOTFILES"
# Zsh config aliases
alias ohmyzsh="cd $DOTFILES/.oh-my-zsh"
alias zshrc='vim ~/.zshrc'
alias zshtheme="vim $DOTFILES/oh-my-zsh-custom/tklarry.zsh-theme"
alias zshreload="clear && source ~/.zshrc"
# Vim config aliases
alias suvim='sudo vim'
alias myvim="cd $DOTFILES/vim/"
alias myvimbundle="cd $DOTFILES/vim/bundle"
alias vimrc='vim ~/.vimrc'
alias vundle="vim $DOTFILES/vim/vundle.vim"
# Git config aliases
alias gitconf='vim ~/.gitconfig'
# Blogging using jekyll
alias tk.me='cd ~/Sites/tklarryonline.me/tklarryonline.github.io'
alias tk.run='jekyll serve --watch'
alias tk.io='tk.me && tk.run'
# rm aliases
alias rmrf='rm -rf'
# other aliases
alias cl='clear'

### Exports
export TERM='xterm-256color'
export EDITOR=vim
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=xim

### Some conditions
# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ]; then
	[ -e "$HOME/.dircolors" ] && DIR_COLORS="$HOME/.dircolors"
	[ -e "$DIR_COLORS" ] || DIR_COLORS=""
	eval $(dircolors $HOME/dotfiles/dircolors)
	alias ls='ls -G'
	alias dir='ls -G --format=vertical'
	alias vdir='ls -G --format=long'
fi

### My own functions
#
# mkgo - mkdir + cd
mkgo() {
	mkdir $1 && cd $1
}


