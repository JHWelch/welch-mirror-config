#!/bin/bash
set -e

source ./scripts/read_env.sh

echo "Copying config file to remote at: $MIRROR_IP"

envsubst < config.js | ssh $MIRROR_USER@$MIRROR_IP -T "cat > ~/MagicMirror/config/config.js"

echo "\033[33;32mSuccessfully copied config to remote.\033[0m"

echo "Restarting Magic Mirror"

ssh $MIRROR_USER@$MIRROR_IP -T "pm2 restart mm"

echo "\033[33;32mStarted Restart of Magic Mirror"
