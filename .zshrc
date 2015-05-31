###### OH MY ZSH #######

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="dannysmith"

plugins=(bower brew brew-cask bundler cloudapp colored-man colorize common-aliases cp docker gem git git-extras gitignore heroku history osx rails rake rbenv ruby zsh-syntax-highlighting zsh-autosuggestions)

# Enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# User configuration

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/dsa_id"



###### ZSH CONFIG #######

export PATH="/Users/danny/.rbenv/shims:/usr/local/mysql/bin:/usr/local/bin:/usr/local/share/npm/bin:/usr/local/lib/node_modules:/usr/local/git/bin:/usr/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin"

# Add Postgres.app command line tools
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.4/bin

# export MANPATH="/usr/local/man:$MANPATH"

# added by travis gem
[ -f /Users/danny/.travis/travis.sh ] && source /Users/danny/.travis/travis.sh

# Code Completion from zsh-completions
fpath=(/usr/local/share/zsh-completions $fpath)

# Enable autosuggestions automatically.
# https://github.com/tarruda/zsh-autosuggestions
source ~/.zsh/zsh-autosuggestions/autosuggestions.zsh
zle-line-init() {
    zle autosuggest-start
}
zle -N zle-line-init


###### ZSH CONFIG - ORIGINALY FROM MY BASH_CONFIG #######

# This adds the default folder for the omnifocus gem to create new projects in, without this environment variable, the default is 'nerd'
export OF_FOLDER="Other"

# Add git, node and homebrew /bin's to PATH.
export PATH=/usr/local/mysql/bin:/usr/local/bin:/usr/local/share/npm/bin:/usr/local/lib/node_modules:/usr/local/git/bin:/usr/bin:$PATH

# NOTE: Sublime text is aliased as "st", through a symlink saved in /usr/bin.

#Sets SVN, GVS and default editors to Sublime Text 2
 export EDITOR="vim"
 export CVSEDITOR="vim"
 export SVN_EDITOR="vim"

# # Enable shims and autocompletion for rbenv
if which rbenv > /dev/null; then eval "$(rbenv init - zsh)"; fi

# common typos
alias ts='st'
alias st.='st .'

#Alias for wget
alias wget="curl -O"

# Start SQL
alias smysql="/usr/local/bin/mysql.server start"

export CLICOLOR=1
export LSCOLORS=dxfxcxcxbxexexbxbxDADA
# See http://softwaregravy.wordpress.com/2010/10/16/ls-colors-for-mac/

# More Git aliases
alias git='hub'
alias g='git'
alias gst='git status -s'
alias gpull='git pull'
alias gp='git push'
alias gd='git diff'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gcm='git commit -m'
alias gco='git checkout'
alias gb='git branch'
alias gba='git branch -a'
alias glog='git log --oneline --decorate'
alias glogg='git log --oneline --decorate --graph'
alias glogs='git log --oneline --decorate --stat'
alias gcl='git clone'
alias gdc='git difftool --cached'

# See https://github.com/qw3rtman/gg#installation
alias gg='noglob gg'

#Allows calling wikipedia using DNS
function wp {
  dig +short txt ${1}.wp.dg.cx
}

# #Aliases for ls
alias ll='ls -lh'
alias l='ls -lhA'
alias lsa='ls -a'

alias rm='rm -i'

#Apache commands
alias apaches='sudo apachectl start'
alias apacher='sudo apachectl restart'
alias apachestop='sudo apachectl stop'

#For handling the blog
function blog {
  cd ~/Dropbox/dev/dasmith

  if [[ $# = 0 ]]
  then
    echo "Opening Blog"
  else
    echo "Running rake task"
    rake "$@"
  fi
}

# Alias to clear MS OfficeFileCaches - resolves issue with Onedrive for business Crashing
function clearofficecache {
  IFS=$'\n'
  for i in `find ~/Library -name OfficeFileCache`; do echo $i; rm -Rf "$i"; done
}

# Get OS X Software Updates, and update installed Ruby gems, Homebrew, npm, and their installed packages
alias update='sudo softwareupdate -i -a; brew update; brew upgrade; brew cleanup; npm update npm -g; npm update -g; sudo gem update --system; sudo gem update'

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en1"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"
# Enhanced WHOIS lookups
alias whois="whois -h whois-servers.net"

# Flush Directory Service cache
alias flush="dscacheutil -flushcache && killall -HUP mDNSResponder"

# Clean up LaunchServices to remove duplicates in the “Open With” menu
alias lscleanup="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder"

# View HTTP traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# Reload the shell (i.e. invoke as a login shell)
alias reload="exec $SHELL -l"

# Faster npm for europeans
command -v npm > /dev/null && alias npme="npm --registry http://registry.npmjs.eu"

# Kill all the tabs in Chrome to free up memory
# [C] explained: http://www.commandlinefu.com/commands/view/402/exclude-grep-from-your-grepped-output-of-ps-alias-included-in-description
alias chromekill="ps ux | grep '[C]hrome Helper --type=renderer' | grep -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"

# Shortcuts
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias dev="cd ~/Dropbox/dev"
alias inbox="cd ~/Dropbox/Inbox"
alias docs="cd ~/Dropbox/Documents"
alias docsl="cd ~/Documents"
alias raf="cd ~/RAF"
alias sparta="cd ~/Dropbox/Documents/Sparta"
alias sshspartaroot="ssh -X root@unix.spartaglobal.com -R 52698:localhost:52698"
alias sshsparta="ssh -X danny@unix.spartaglobal.com -R 52698:localhost:52698"

