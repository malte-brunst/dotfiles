#!/bin/bash

# bash 'strict' mode
set -euo pipefail
IFS=$'\n\t'

# Examples of call:
# git-init-bare-for-worktrees
# => Creates a bare git repo in the current directory with a .bare directory and prepares it for worktrees

# Get globally configured user name and email
global_user_name=$(git config --global user.name)
global_user_email=$(git config --global user.email)

# Prompt for custom user name and email
echo "Current global user name: ${global_user_name}"
echo "Current global user email: ${global_user_email}"
read -rp "Do you want to use a custom name for the initial commit? (leave empty for default): " custom_user_name
read -rp "Do you want to use a custom email for the initial commit? (leave empty for default): " custom_user_email

# Use custom values if provided, otherwise fall back to global settings
final_user_name=${custom_user_name:-${global_user_name}}
final_user_email=${custom_user_email:-${global_user_email}}

# Initialize a bare repository
git init --bare .bare
echo "gitdir: ./.bare" >.git

# Create an initial commit in a temporary working directory
temp_worktree=$(mktemp -d)

# Set user name and email just for this commit
GIT_AUTHOR_NAME="${final_user_name}" GIT_AUTHOR_EMAIL="${final_user_email}" \
    GIT_COMMITTER_NAME="${final_user_name}" GIT_COMMITTER_EMAIL="${final_user_email}" \
    git --git-dir=.bare --work-tree="${temp_worktree}" commit --allow-empty -m "Initial commit"

# Set user name and email locally for the repository only if custom values are provided
if [[ -n ${custom_user_name} ]]; then
    git config --file .bare/config user.name "${final_user_name}"
fi

if [[ -n ${custom_user_email} ]]; then
    git config --file .bare/config user.email "${final_user_email}"
fi

# Clean up the temporary working directory
rm -rf "${temp_worktree}"

# Create the worktree for the main branch
git worktree add ./main
