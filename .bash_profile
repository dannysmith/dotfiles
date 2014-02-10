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
