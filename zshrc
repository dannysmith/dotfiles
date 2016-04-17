source ~/.commonrc

################ Oh My ZSH ################

# Set Path to oh-my-zsh
export ZSH=$HOME/.oh-my-zsh

# # Theme
ZSH_THEME="dannysmith"

# Pligins
#plugins=(bower brew brew-cask bundler cloudapp colored-man colorize common-aliases cp docker gem git git-extras gitignore heroku history osx rails rake rbenv ruby zsh-syntax-highlighting zsh-autosuggestions)
plugins=(git brew)

# # Enable command auto-correction.
# ENABLE_CORRECTION="true"

# Initialize omzsh
source $ZSH/oh-my-zsh.sh

################ Other ZSH Config ################

# Code Completion from zsh-completions
# fpath=(/usr/local/share/zsh-completions $fpath)

# Enable autosuggestions automatically.
# https://github.com/tarruda/zsh-autosuggestions
# source ~/.zsh/zsh-autosuggestions/autosuggestions.zsh
# zle-line-init() {
#     zle autosuggest-start
# }
# zle -N zle-line-init
