#!/bin/bash

# Usage: ./download_instagram.sh <instagram_username>

# # Load .env file if it exists
# if [ -f .env ]; then
#     export $(grep -v '^#' .env | xargs)
# else
#     echo "⚠️  .env file not found. Proceeding without environment variables."
# fi

# Check if username parameter is provided
if [ -z "$1" ]; then
    echo "❌ Error: No Instagram username provided."
    echo "Usage: $0 <instagram_username>"
    exit 1
fi

USERNAME="$1"

# # Optional: Add your own login credentials here
# # Replace with your own username and session if needed
# # Or comment out LOGIN_ARGS if you don’t want to login
# INSTAGRAM_LOGIN="your_ig_username"
# LOGIN_ARGS="--login $INSTAGRAM_LOGIN"

echo "📥 Downloading all posts from @$USERNAME..."

# Run instaloader
# instaloader $LOGIN_ARGS --dirname-pattern "{target}" --no-profile-pic --no-metadata-json "$USERNAME"
instaloader --dirname-pattern "{target}" --no-profile-pic --no-metadata-json "$USERNAME"

# Check success
if [ $? -eq 0 ]; then
    echo "✅ Finished downloading posts from @$USERNAME."
else
    echo "❌ Failed to download posts from @$USERNAME."
fi
