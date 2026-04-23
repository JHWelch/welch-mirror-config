#!/bin/bash
set -e

source ./scripts/read_env.sh

# If $LOCAL_MM is not set, exit with error
if [ -z "$LOCAL_MM" ]; then
  echo "\033[33;31mLOCAL_MM is not set.\033[0m"
  exit 1
fi

MODULE_PATH=$LOCAL_MM/modules

while IFS= read -r line
do
  REPO_NAME=$(basename "$line" .git)

  TARGET_PATH="$MODULE_PATH/$REPO_NAME"

  if [ -d "$TARGET_PATH" ]; then
    echo "Directory $TARGET_PATH already exists, skipping clone."
  else
    git clone "$line" "$TARGET_PATH"
    if [ -f "$TARGET_PATH/package.json" ]; then
      echo "Installing dependencies for $REPO_NAME"
      npm install --prefix "$TARGET_PATH"
    fi
  fi
done < "repos"
