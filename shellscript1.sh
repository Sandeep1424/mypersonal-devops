#!/bin/bash

# Set deployment directory
DEPLOY_DIR="/var/www/myapp"

# Backup the current deployment
TIMESTAMP=$(date +%Y%m%d%H%M%S)
BACKUP_DIR="/var/backups/myapp/backup_$TIMESTAMP"
mkdir -p $BACKUP_DIR
cp -r $DEPLOY_DIR/* $BACKUP_DIR

# Pull the latest changes from your Git repository
cd $DEPLOY_DIR
git pull

# Install dependencies
npm install

# Restart the application
pm2 restart myapp

