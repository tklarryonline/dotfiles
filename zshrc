### ENV vars
# My personal folders
DOTFILES=$HOME/dotfiles
PROJ=$HOME/Dev
CONFIGS=$HOME/.config

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
plugins=(brew bundler command-not-found git zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

###############################################################################
### Customize to your needs...
###############################################################################

### My own aliases
# Prefer NeoVim (nvim) over Vim
alias vim=nvim
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
# important dir aliases
alias dotfiles="cd $DOTFILES"
# Zsh config aliases
alias ohmyzsh="cd $DOTFILES/.oh-my-zsh"
alias zshrc='vim ~/.zshrc'
alias zshtheme="vim $DOTFILES/oh-my-zsh-custom/tklarry.zsh-theme"
alias reloadshell="eval $SHELL && clear"
# Vim config aliases
alias suvim='sudo vim'
# Git config aliases
alias gitconf='vim ~/.gitconfig'
# Blogging using jekyll
alias tk.me="cd $PROJ/personal/tk.io"
# rm aliases
alias rmrf='rm -rf'
# other aliases
alias cl='clear'
alias wifi_off='networksetup -setairportpower en0 off'
alias wifi_on='networksetup -setairportpower en0 on'

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

# new dock space
new_dock_space() {
    defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="spacer-tile";}'; killall Dock
}



PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # This loads RVM

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Added brew path
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# Virtualenv paths
export WORKON_HOME=$HOME/.virtualenvs

# Added GNU gettext library
export PATH="/usr/local/opt/gettext/bin:$PATH"

# PyENV configs
eval "$(pyenv init -)"
export PYENV_ROOT="$(pyenv root)"
# PyENV Virtualenvwrapper
export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"
pyenv virtualenvwrapper

# added by travis gem
[ -f /Users/tklarryonline/.travis/travis.sh ] && source /Users/tklarryonline/.travis/travis.sh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Configuration for icu4c
export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"
