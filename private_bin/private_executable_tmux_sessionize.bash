#!/bin/bash

# bash 'strict' mode
set -euo pipefail
IFS=$'\n\t'

# Examples of call:
# source tmux_sessionize my_repo
# => Creates a new tmux session of name my_repo and changes directory into the my_repo directory

# Check if the argument is provided
if [ "${#}" -ne 1 ]; then
    echo "Usage: $0 <repository name>"
    exit 1
fi

# Define the directory to search for
DIRECTORY_NAME="${1}"
REPOSITORY="${HOME}/Repositories/${DIRECTORY_NAME}"

# Check for chezmoi
if [ "${DIRECTORY_NAME}" = 'chezmoi' ]; then
    tmux new-session -d -s "${DIRECTORY_NAME}" -n main
    tmux send-keys -t "${DIRECTORY_NAME}" "cd ${HOME}/.local/share/chezmoi" C-m
    tmux switch -t "${DIRECTORY_NAME}"
elif [ -d "${REPOSITORY}" ]; then
    tmux new-session -d -s "${DIRECTORY_NAME}"
    tmux send-keys -t "${DIRECTORY_NAME}" "cd ${HOME}/Repositories/${DIRECTORY_NAME}" C-m
    tmux switch -t "${DIRECTORY_NAME}"
else
    echo "Error: Repository '${DIRECTORY_NAME}' does not exist in ~/Repositories."
    exit 1
fi
