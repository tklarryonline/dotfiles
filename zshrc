### ENV vars
# My personal folders
DOTFILES=$HOME/dotfiles
PROJ=$HOME/Projects

# Path to your oh-my-zsh configuration.
ZSH=$DOTFILES/oh-my-zsh

# Path to my custom folders
ZSH_CUSTOM=$DOTFILES/oh-my-zsh-custom

# I will use my own theme!
ZSH_THEME="tklarry"

### Which plugins would you like to load?
# (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(brew bundler command-not-found extract gem git pip rails ruby rvm zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

###############################################################################
### Customize to your needs...
###############################################################################

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
alias vimrc="vim $DOTFILES/vim/vimrc"
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

### Some conditions
# OS specific settings
if [[ "$OSTYPE" == "darwin"* ]]; then
    # Mac OS X settings
    source $DOTFILES/os-specific-settings/mac-os-x.sh
elif [[ "$OSTYPE" == "linux-gnu" ]]; then
    # Linux GNU
    source $DOTFILES/os-specific-settings/linux.sh
fi

### My own functions
#
# mkgo - mkdir + cd
mkgo() {
	mkdir $1 && cd $1
}



PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # This loads RVM

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
