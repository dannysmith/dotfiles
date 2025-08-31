source ~/.commonrc

# Path to your oh-my-zsh installation.
export ZSH="/Users/danny/.oh-my-zsh"

# Path to oh-my-zsh theme
ZSH_THEME="dannysmith"

### ----------------------------------------------------------------------------------------
### Ensure you have the following in ~/.oh-my-zsh/custom/themes/dannysmith.zsh-theme:
###    NEWLINE=$'\n'
###
###    PROMPT="${NEWLINE}%{$fg[blue]%}%~%{$reset_color%}"
###    PROMPT+=' $(git_prompt_info)'
###    PROMPT+="${NEWLINE}"
###    PROMPT+='%(?:%{$fg_bold[green]%}%1{➜%} :%{$fg_bold[red]%}%1{➜%} ) '
###
###    ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}(%{$fg[red]%}"
###    ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
###    ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}%1{✗%}"
###    ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
### ----------------------------------------------------------------------------------------


# Automatically update without prompting.
DISABLE_UPDATE_PROMPT="true"


################ Oh My ZSH Plugins ################

plugins=(
  git
  brew
  macos
  zsh-autosuggestions
)

# ZSH Autosuggestions Performance Improvements
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE="20"
ZSH_AUTOSUGGEST_USE_ASYNC=1

# Enable homebrew shell completions
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  compinit
fi

source $ZSH/oh-my-zsh.sh

# Override gcm provided by zsh-git plugin (https://github.com/robbyrussell/oh-my-zsh/blob/master/plugins/git/git.plugin.zsh)
alias gcm='git commit -m'

# Load FNM node version manager
eval "`fnm env`"

# Created by `pipx` on 2025-05-25 15:24:42
if [ -f ~/.github_token ]; then
  export GITHUB_TOKEN=$(cat ~/.github_token)
fi
