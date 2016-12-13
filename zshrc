source ~/.commonrc

################ Oh My ZSH ################

# Set Path to oh-my-zsh
export ZSH=$HOME/Dropbox/dev/oh-my-zsh

# # Theme
ZSH_THEME="dannysmith"

# # Enable command auto-correction.
ENABLE_CORRECTION="true"

################ Oh My ZSH Plugins ################
#plugins=(bower brew brew-cask bundler cloudapp colored-man colorize common-aliases cp docker gem git git-extras gitignore heroku history osx rails rake rbenv ruby zsh-syntax-highlighting zsh-autosuggestions)
plugins=(git git-extras) # Git plugins
plugins+=(brew osx colored-man last-working-dir) # Standard & OSX plugins
plugins+=(ruby gem heroku bundler) # Ruby plugins
plugins+=(npm) # JavaScript plugins


# Additional completiones, not included in the OMZSH master.
# Custom plugin (see oh-my-zsh/custom)
plugins+=(zsh-completions)
autoload -U compinit && compinit
fpath=(/usr/local/share/zsh-completions $fpath)

# ZSH Autosuggestions (as you type)
# Custom plugin (see oh-my-zsh/custom)
# See https://github.com/tarruda/zsh-autosuggestions
plugins+=(zsh-autosuggestions)

# Highlight terminal commands for correctness on-the-fly
# Custom plugin (see oh-my-zsh/custom)
# This mist be the last plugin sourced before initializing OMZSH.
plugins+=(zsh-syntax-highlighting)


################ Initialize Oh-my-ZSH ################

source $ZSH/oh-my-zsh.sh


################## Other ZSH Config ##################

alias gcm='git commit -m' # Override gcm provided by zsh-git plugin (https://github.com/robbyrussell/oh-my-zsh/blob/master/plugins/git/git.plugin.zsh)

## NVM
export NVM_DIR="$HOME/.nvm"
. "$(brew --prefix nvm)/nvm.sh"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
