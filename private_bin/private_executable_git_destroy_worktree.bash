#!/bin/bash

# bash 'strict' mode
set -euo pipefail
IFS=$'\n\t'

# Examples of call:
# git_destory_worktree.bash my_worktree_name
# => Removes the worktree with name my_worktree_name
# => Removes remote branch with name my_worktree_name on origin (if exists)
# => Removes local branch with name my_wortkree_name (if exists)

worktree_name=$1

git worktree remove "${worktree_name}"
git push -d origin "${worktree_name}"
git branch -D "${worktree_name}"
