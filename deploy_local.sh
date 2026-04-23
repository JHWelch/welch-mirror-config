#!/bin/bash
set -e

source ./scripts/read_env.sh

# If $LOCAL_MM is not set, exit with error
if [ -z "$LOCAL_MM" ]; then
  echo "\033[33;31mLOCAL_MM is not set.\033[0m"
  exit 1
fi

CONFIG_PATH=$LOCAL_MM/config/config.js

envsubst < config.js > $CONFIG_PATH

echo "\033[33;32mConfig copied to $CONFIG_PATH.\033[0m"
