#!/bin/bash

# See: http://grandadevans.com/show-the-git-branch-name-and-if-you-have-untracked-or-modified-files-in-the-command-prompt/

#=========================
# Set Variables
#=========================

GIT_RED="\033[31m"
GIT_GREEN="\033[32m"

function gitParseStatus {
	# If we fail to get a branch name then simply return empty handed :-(
	IN=$(git symbolic-ref HEAD 2> /dev/null) || return

	FILES=$(git status -z 2> /dev/null)

	if [[ -z "$FILES" ]]; then
		echo -e ${GIT_GREEN}⋆
	else
		echo -e ${GIT_RED}⋆
	fi
}
