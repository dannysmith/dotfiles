ZSH_THEME_GIT_PROMPT_SUFFIX="$reset_color"
ZSH_THEME_GIT_PROMPT_DIRTY="$fg[red]⋆"
ZSH_THEME_GIT_PROMPT_CLEAN="$fg[green]⋆"

function git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo " $purple- $(parse_git_dirty)$fg[yellow]$(current_branch)"
}

purple="%F{135}"

PROMPT='%{$fg[cyan]%}%~$(git_prompt_info)
%{$fg[green]%}➟%{$reset_color%} '

if [[ "$USER" == "root" ]]; then
PROMPT='%{$fg[cyan]%}%~$(git_prompt_info)
%{$fg[red]%}ⓡ  %{$fg[green]%}➟%{$reset_color%} '
fi

# Font for remote/SSH connections
if [[ -n $SSH_CONNECTION ]]; then
PROMPT='%{$fg[cyan]%}%~$(git_prompt_info)
%{$fg[yellow]%}☁  %{$fg[green]%}➟%{$reset_color%} '
fi
