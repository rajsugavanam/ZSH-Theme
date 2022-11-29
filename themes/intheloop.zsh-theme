# A multiline prompt with username, hostname, full path, return status, git branch, git dirty status, git remote status

local return_status="%{$fg[red]%}%(?..⏎)%{$reset_color%}"

local host_color="magenta"
if [ -n "$SSH_CLIENT" ]; then
  local host_color="green"
fi

PROMPT='
%{$fg_bold[black]%}[%{$reset_color%}%{$fg_bold[${host_color}]%}%n@%m%{$reset_color%}%{$fg_bold[black]%}]%{$reset_color%} %{$fg_bold[black]%}[%{$fg_bold[blue]%}%10c%{$reset_color%}%{$fg_bold[black]%}] $(git_prompt_info) $(git_remote_status)
%{$reset_color%}%{$fg_bold[red]%}❯❯%{$reset_color%} '


RPROMPT='${return_status}%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[black]%}(%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg_bold[black]%})%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%} ⏺%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE="%{$fg[cyan]%} ↓%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE="%{$fg[cyan]%} ↑%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIVERGED_REMOTE="%{$fg[cyan]%} ↕%{$reset_color%}"
