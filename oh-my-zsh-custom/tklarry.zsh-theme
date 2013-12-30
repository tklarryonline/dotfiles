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
BRANCH="$MIDDOT"

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
# on BRANCH (STATE)
local git_info='$(git_prompt_info)'
ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[blue]%}$BRANCH"
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$reset_color%} (%{$fg[red]%}x%{$reset_color%})"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$reset_color%} (%{$fg[green]%}${CHECK}%{$reset_color%})"

# Prompt format:
# USER at DIRECTORY on BRANCH (STATE) (TIME)
# → <cmd here>
PROMPT="
%{$fg[cyan]%}%n%{$reset_color%} at \
%{$fg[yellow]%}${current_dir}%{$reset_color%}\
${git_info} \
%{$fg[white]%}(%*)
%{$terminfo[bold]$fg[blue]%}$FF_ARROW %{$reset_color%}"
