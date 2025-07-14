source ~/.commonrc

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

################ Bash Autocompletions ################

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/danny/.lmstudio/bin"
# End of LM Studio CLI section

