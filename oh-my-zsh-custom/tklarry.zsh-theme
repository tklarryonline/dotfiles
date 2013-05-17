# My first creation in zsh theme, following a lot of tutorials on the Internet.
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
BRANCH="⭠"

# Machine name.
function box_name {
    [ -f ~/.box-name ] && cat ~/.box-name || hostname -s
}

# prompt_char function
# Change the prompt based on current dir:
# normal prompt: →
# gitdir prompt: ±
function prompt_char {
	git branch >/dev/null 2>/dev/null && echo '±' && return
	echo '→'
}

# Directory info.
# Collapsed already
local current_dir='${PWD/#$HOME/~}'

# Git info.
# [⭠ BRANCH] [STATE]
local git_info='$(git_prompt_info)'
ZSH_THEME_GIT_PROMPT_PREFIX=" [%{$fg[blue]%}$BRANCH "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}]"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$reset_color%}] [%{$fg[red]%}x"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$reset_color%}] [%{$fg[green]%}${CHECK}"

# Prompt format:
# USER: DIRECTORY [⭠ BRANCH] [STATE] [TIME]
# → <cmd here>
PROMPT="
%{$fg[cyan]%}%n%{$reset_color%}: \
%{$fg[yellow]%}${current_dir}%{$reset_color%}\
${git_info} \
%{$fg[white]%}[%*]
%{$terminfo[bold]$fg[blue]%}$FF_ARROW %{$reset_color%}"
