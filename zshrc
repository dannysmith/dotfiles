# zmodload zsh/zprof # Uncomment for Profiling

source ~/.commonrc

# Theme
ZSH_THEME="dannysmith"

################ Oh My ZSH Plugins ################

plugins=(git) # Git plugins
plugins+=(brew osx colored-man-pages last-working-dir) # Standard & OSX plugins
plugins+=(ruby) # Ruby plugins

# ZSH Autosuggestions (as you type)
# See https://github.com/tarruda/zsh-autosuggestions
plugins+=(zsh-autosuggestions)

# Highlight terminal commands for correctness on-the-fly
# This mist be the last plugin sourced before initializing OMZSH.
plugins+=(zsh-syntax-highlighting)

# Initialize Oh-my-ZSH
source $ZSH/oh-my-zsh.sh

# Override gcm provided by zsh-git plugin (https://github.com/robbyrussell/oh-my-zsh/blob/master/plugins/git/git.plugin.zsh)
alias gcm='git commit -m'

## iTerm integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# zprof # Uncomment for Profiling

# Load FNM node version manager
eval "`fnm env`"
