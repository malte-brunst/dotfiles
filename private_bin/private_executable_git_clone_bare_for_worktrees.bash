#!/bin/bash

# bash 'strict' mode
set -euo pipefail
IFS=$'\n\t'

# Examples of call:
# git_clone_bare_for_worktrees.bash git@github.com:name/repo.git
# => Clones to a /repo directory
#
# git_clone_bare_for_worktrees.bash git@github.com:name/repo.git my_repo
# => Clones to a /my_repo directory

url=$1
basename=${url##*/}
name=${2:-${basename%.*}}

mkdir "${name}"
cd "${name}"

# Moves all the administrative git files (a.k.a $GIT_DIR) under .bare directory.
#
# Plan is to create worktrees as siblings of this directory.
# Example targeted structure:
# .bare
# main
# new-awesome-feature
# hotfix-bug-12
# ...
git clone --bare "${url}" .bare
echo "gitdir: ./.bare" >.git

# Explicitly sets the remote origin fetch so we can fetch remote branches
git config remote.origin.fetch "+refs/heads/*:refs/remotes/origin/*"

# Gets all branches from origin
git fetch origin

# Then you can create worktrees with:
# git worktree add main
