# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# I will use my own theme!
ZSH_THEME="tklarry"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

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

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
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
alias cd..='cd ..'
alias cd...='cd ../..'
alias cd....='cd ../../..'
# xsel aliases
alias xselclip='xsel --clipboard'
# make aliases
alias makelog='make >&log'
# sudo aliases
alias suvim='sudo vim'

### My own functions
#
# mkgo - mkdir + cd
mkgo() {
	mkdir $1 && cd $1
}


