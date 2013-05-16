# My first creation in zsh theme, following a lot of tutorials on the Internet.
#
#
# May 15, 2013 - tklarry

# My symbols
LIGHTNING_BOLT="⚡"
UP_ARROW="↑"
DOWN_ARROW="↓"
UD_ARROW="↕"
FF_ARROW="→"
RECYCLE="♺"
MIDDOT="•"
PLUSMINUS="±"
CHECK="✔"

# Machine name.
function box_name {
    [ -f ~/.box-name ] && cat ~/.box-name || hostname -s
}

# Directory info.
local current_dir='${PWD/#$HOME/~}'

# Git info.
local git_info='$(git_prompt_info)'
ZSH_THEME_GIT_PROMPT_PREFIX=" [git:%{$fg[cyan]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}]"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}x"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}${CHECK}"

# Prompt format: \n USER: DIRECTORY [ BRANCH STATE [TIME] ] \n → 
PROMPT="
%{$fg[cyan]%}%n%{$reset_color%}: \
%{$fg[yellow]%}${current_dir}%{$reset_color%}\
${git_info} \
%{$fg[white]%}[%*]
%{$terminfo[bold]$fg[blue]%}${FF_ARROW} %{$reset_color%}"
