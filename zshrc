# zmodload zsh/zprof # Uncomment for Profiling

source ~/.commonrc

################ Oh My ZSH ################

# Set Path to oh-my-zsh
source ~/.ohmyzshpath.local

# # Theme
ZSH_THEME="dannysmith"

# # Disable command auto-correction.
unsetopt correct_all

################ Oh My ZSH Plugins ################
#plugins=(bower brew brew-cask bundler cloudapp colored-man colorize common-aliases cp docker gem git git-extras gitignore heroku history osx rails rake rbenv ruby zsh-syntax-highlighting zsh-autosuggestions)
plugins=(git git-extras) # Git plugins
plugins+=(brew osx colored-man last-working-dir) # Standard & OSX plugins
plugins+=(ruby gem heroku bundler) # Ruby plugins
plugins+=(npm) # JavaScript plugins


# Additional completiones, not included in the OMZSH master.
# Custom plugin (see oh-my-zsh/custom)
plugins+=(zsh-completions)

# FROM: https://gist.github.com/ctechols/ca1035271ad134841284#gistcomment-2609770
# On slow systems, checking the cached .zcompdump file to see if it must be
# regenerated adds a noticable delay to zsh startup.  This little hack restricts
# it to once a day.
autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done
compinit -C

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

## Set History Size and Save History Size
HISTSIZE=5000
SAVEHIST=5000

## Disable Git zsh integration to help speed things up.
# See https://blog.jonlu.ca/posts/speeding-up-zsh#observations
DISABLE_UNTRACKED_FILES_DIRTY="true"

## Set NVM Path
export NVM_DIR="$HOME/.nvm"

# Lazy load nvm.sh to prevent slow shell startup
function nvm() {
  echo "🚨 No nvm command!"
  NVM_PREFIX=$(brew --prefix nvm)

  echo "Setting BREW_NVM_SCRIPT_PATH to $NVM_PREFIX/nvm.sh"
  export BREW_NVM_SCRIPT_PATH="$NVM_PREFIX/nvm.sh"
  . $(echo $BREW_NVM_SCRIPT_PATH) "$@"
  echo "\e[93mRunning \`\e[92m$0 $@\e[93m\` again\e[39m..."
  nvm "$@"
}

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# zprof # Uncomment for Profiling
