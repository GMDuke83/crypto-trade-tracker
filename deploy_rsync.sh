
#!/usr/bin/env bash
set -euo pipefail
# Edit these:
REMOTE_USER="user"
REMOTE_HOST="your.server.com"
REMOTE_DIR="/var/www/ctt"

# Sync (deletes remote files that no longer exist locally)
rsync -avz --delete   --exclude='.git'   --exclude='.DS_Store'   ./ "${REMOTE_USER}@${REMOTE_HOST}:${REMOTE_DIR}/"

echo "Deployed to ${REMOTE_USER}@${REMOTE_HOST}:${REMOTE_DIR}"
