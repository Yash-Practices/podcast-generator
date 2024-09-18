#!/bin/bash

# Exit the script if any command fails
set -e

echo "=========================="

# Configure Git with the provided user details
git config --global user.name "${GITHUB_ACTOR}"
git config --global user.email "${INPUT_EMAIL}"

# Add the GitHub workspace as a safe directory
git config --global --add safe.directory /github/workspace

# Execute the Python script
python3 /usr/bin/feed.py

# Stage all changes, commit, and push
git add -A 
git commit -m "Update Feed"

# Push to the correct branch, defaulting to 'main'
git push --set-upstream origin main

echo "=========================="
