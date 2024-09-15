# A multiline prompt with username, hostname, full path, return status, git branch, git dirty status, git remote status

local return_status="%{$fg[red]%}%(?..⏎)%{$reset_color%}"

local host_color="magenta"
if [ -n "$SSH_CLIENT" ]; then
  local host_color="green"
fi

virtualenv_prompt() {
	if [ ! -z ${CONDA_DEFAULT_ENV} ]; then
		echo "%{$fg_bold[black]%}[%{$fg[cyan]%}${CONDA_DEFAULT_ENV}%{$fg_bold[black]%}] "
	fi
	echo ""
}


PROMPT='
$(virtualenv_prompt)%{$fg_bold[black]%}[%{$reset_color%}%{$fg_bold[${host_color}]%}%n@%m%{$reset_color%}%{$fg_bold[black]%}]%{$reset_color%} %{$fg_bold[black]%}[%{$fg_bold[blue]%}%10c%{$reset_color%}%{$fg_bold[black]%}] $(git_super_status)
%{$reset_color%}%{$fg_bold[red]%}❯❯%{$reset_color%} '

# old:  $(git_prompt_info) $(git_remote_status).

RPROMPT='${return_status}%{$reset_color%}'

# ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[black]%}(%{$fg[yellow]%}"
# ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg_bold[black]%})%{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%} ⏺%{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_CLEAN=""
# ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE="%{$fg[cyan]%} ↓%{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE="%{$fg[cyan]%} ↑%{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_DIVERGED_REMOTE="%{$fg[cyan]%} ↕%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[black]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg_bold[black]%}]"
ZSH_THEME_GIT_PROMPT_SEPARATOR=" %{$fg_bold[black]%}|"
ZSH_THEME_GIT_PROMPT_BRANCH="%{$fg_bold[yellow]%} "

ZSH_THEME_GIT_PROMPT_STAGED=" %{$fg[blue]%}%{%G%} "
ZSH_THEME_GIT_PROMPT_CONFLICTS=" %{$fg[red]%}%{%G%} "
ZSH_THEME_GIT_PROMPT_CHANGED=" %{$fg[green]%}%{✚%G%}"
ZSH_THEME_GIT_PROMPT_DELETED=" %{$fg[red]%}%{-%G%}"

ZSH_THEME_GIT_PROMPT_BEHIND=" %{$fg[yellow]%}%{↓%G%} "
ZSH_THEME_GIT_PROMPT_AHEAD=" %{$fg[yellow]%}%{↑%G%} "

ZSH_THEME_GIT_PROMPT_UNTRACKED=" %{$fg[cyan]%}%{…%G%}"
ZSH_THEME_GIT_PROMPT_STASHED=" %{$fg_bold[white]%}%{⚑%G%} "
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg_bold[green]%}%{󰸞%G%}"

ZSH_THEME_GIT_PROMPT_UPSTREAM_SEPARATOR=" ->"
