#!/bin/bash

# Check if a commit message is provided
if [ -z "$1" ]; then
  echo "Error: Commit message is required."
  echo "Usage: ./git_push.sh \"Your commit message\""
  exit 1
fi

# Assign the first argument as the commit message
COMMIT_MESSAGE="$1"

# Run git commands
git add .
git commit -m "$COMMIT_MESSAGE"

# Check if the commit was successful
if [ $? -eq 0 ]; then
  git push
else
  echo "Error: Commit failed. Aborting push."
  exit 1
fi
