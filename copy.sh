#!/bin/bash
set -e

# Load .env values
set -o allexport; source .env; set +o allexport

envsubst < config.js | pbcopy

echo "\033[33;32mConfig copied to clipboard.\033[0m"
