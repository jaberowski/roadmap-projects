#!/bin/bash
# deploy.sh - deploy a static site to a remote server using rsync

# ===============================
# CONFIGURATION - EDIT THESE
# ===============================
# Path to your SSH private key
SSH_KEY="$HOME/.ssh/id_rsa"

# Remote server info
REMOTE_USER="your_username"
REMOTE_HOST="your_server_ip_or_domain"

# Remote directory where site will be deployed
REMOTE_DIR="/var/www/mysite"

# If the first argument is passed, use it as LOCAL_DIR
# Otherwise, default to ./site
# You can change the default folder here if you want
LOCAL_DIR="${1:-./site}"

# ===============================
# SCRIPT
# ===============================

echo "Starting deployment to $REMOTE_USER@$REMOTE_HOST:$REMOTE_DIR ..."

# Create remote directory if it doesn't exist
ssh -i "$SSH_KEY" "$REMOTE_USER@$REMOTE_HOST" "mkdir -p '$REMOTE_DIR'"

# Rsync files
rsync -avz --delete \
    --chmod=D755,F644 \
    -e "ssh -i '$SSH_KEY'" \
    "$LOCAL_DIR/" \
    "$REMOTE_USER@$REMOTE_HOST:$REMOTE_DIR"


echo "Deployment complete!"