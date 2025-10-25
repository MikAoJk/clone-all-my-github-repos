#!/bin/bash

GH_USER="MikAoJk"

TARGET_DIR="$HOME/git/priv"

# Create the target directory if it doesn't exist
mkdir -p "$TARGET_DIR"
cd "$TARGET_DIR" || exit 1

# Fetch all repo names (personal, not forks)
gh repo list "$GH_USER" --limit 1000 --json name,sshUrl,isFork --jq '.[] | select(.isFork == false) | .sshUrl' |
while read -r repo_url; do
  git clone "$repo_url"
done

echo "All personal repositories cloned to $TARGET_DIR"
