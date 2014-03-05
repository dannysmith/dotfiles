#This is the path variable for my current projects path. It changes as I change projects.
export CPPATH="~/Dropbox/CTS/Projects/iRedeem/trunk/stories "

# Add git, node and homebrew /bin's to PATH.
export PATH=/usr/local/mysql/bin:/usr/local/bin:/usr/local/share/npm/bin:/usr/local/lib/node_modules:/usr/local/git/bin:/usr/bin:$PATH

# NOTE: Sublime text is aliased as "st", through a symlink saved in /usr/bin.

#Sets SVN, GVS and default editors to Sublime Text 2
 export EDITOR="st -w"
 export CVSEDITOR="st -w"
 export SVN_EDITOR="st -w"


# Don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups

# Enable shims and autocompletion for rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# common typos
alias mt='mate'
alias amte='mate'
alias atme='mate'
alias mate.='mate .'

#Alias for wget
alias wget="curl -O"

# Include my own git parse type function
source ~/.git_status_in_prompt.sh

#Sets the shell prompt to "DIRECTORY [- GIT_BARNCH]\n→"
export PS1='\[\033[36m\]\w $(git branch &>/dev/null; if [ $? -eq 0 ]; then \
echo "\[\033[34m\]- $(gitParseStatus)\[\033[33m\]$(git branch | grep ^*|sed s/\*\ //)"; fi)\[\033[32m\]\n→ \[\033[00m\]'

export CLICOLOR=1
export LSCOLORS=dxfxcxcxbxexexbxbxDADA
# See http://softwaregravy.wordpress.com/2010/10/16/ls-colors-for-mac/

# More Git aliases
alias git='hub'
alias g='git'
alias gst='git status -s'
alias gl='git pull'
alias gp='git push'
alias gd='git diff'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gcm='git commit -a -m'
alias gco='git checkout'
alias gb='git branch'
alias gba='git branch -a'
alias glog='git log --oneline --decorate'

#Allows calling wikipedia using DNS
function wp {
  dig +short txt ${1}.wp.dg.cx
}

#Writes Lorem ipsum to the clipboard
function lorem {
	http http://loripsum.net/api/${1-5}/plaintext | pbcopy
}

#Sets shortcut for changing to current project path.
alias cdw="cd $CPPATH"

#alias for YUI Compressor
alias yuicompress="java -jar ~/Documents/Resources/binaries/yuicompressor-2.4.2.jar"

#alias for stroke
alias stroke="/Applications/Utilities/Network\ Utility.app/Contents/Resources/stroke"

#Aliases for ls
alias ls='ls $LS_OPTIONS'
alias ll='ls $LS_OPTIONS -lh'
alias l='ls $LS_OPTIONS -lhA'
alias lsa='ls -a $LS_OPTIONS'

#Apache commands
alias apaches='sudo apachectl start'
alias apacher='sudo apachectl restart'
alias apachestop='sudo apachectl stop'

#Alias for Tree Command
alias tree="find . -type d | sed -e 1d -e 's/[^-][^\/]*\//--/g' -e 's/^/ /' -e 's/-/|-/'"

#Running a sinatra app.
function run {
  if [ $# = 0 ]
  then
    echo "Running with run.rb..."
    ruby run.rb
  else
    if [ $1 = s ]
    then
      echo "Running with Shotgun blazing..."
      shotgun -p 4567 config.ru
		else
			if [ $1 = r ]
	    then
	      echo "Running with Rackup"
	      rackup -p 4567
	    fi
    fi
  fi
}

# Alisa for browserstack
function bstack {
  "java -jar ~/Documents/Resources/Binaries/BrowserStackTunnel.jar r3JRlD6fPuezMmz1ZEyS $1,80,0"
}

# iA Writer
ia() {
   for FILE in "$@"; do
      if [ ! -e "$FILE" ]; then
        touch "$FILE"
      fi
   done
   open -a "iA Writer" "$@"
}

# Writer Pro
wt() {
   for FILE in "$@"; do
      if [ ! -e "$FILE" ]; then
        touch "$FILE"
      fi
   done
   open -a "Writer Pro" "$@"
}




#For handling the blog
function blog {
  cd ~/Dropbox/projects/B/dasmith

  if [[ $# = 0 ]]
  then
    echo "Opening Blog"
  else
    echo "Running rake task"
    rake "$@"
  fi
}


###########
# From: https://github.com/mathiasbynens/dotfiles/blob/master/.bash_profile
###########

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
  shopt -s "$option" 2> /dev/null
done

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2 | tr ' ' '\n')" scp sftp ssh

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults

# Add `killall` tab completion for common apps
complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal Twitter" killall

# If possible, add tab completion for many more commands
[ -f /etc/bash_completion ] && source /etc/bash_completion

# Homebrew tab completion
source `brew --repository`/Library/Contributions/brew_bash_completion.sh



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




# From https://github.com/rupa/z
# See ~/.z
. ~/.zz/z.sh
