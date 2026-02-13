#!/bin/bash

# Sync notebooks from Databricks to local Git repository
# Usage: ./sync-from-databricks.sh

set -e

# Configuration
DATABRICKS_USER_PATH="/Users/sagarrdass@outlook.com/databricks-practice"

echo "🔄 Syncing notebooks from Databricks to local..."

# Export specific notebook
echo "📥 Exporting practice-notebook-1..."
databricks workspace export "${DATABRICKS_USER_PATH}/practice-notebook-1" \
  --file practice-notebook-1.py \
  --format SOURCE

echo "✅ Export complete!"

# Optional: Add and commit to git
read -p "Do you want to commit changes to Git? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    git add .
    read -p "Enter commit message: " commit_msg
    git commit -m "$commit_msg"
    echo "✅ Changes committed!"

    read -p "Do you want to push to GitHub? (y/n) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
        git push origin main || git push origin master
        echo "✅ Changes pushed to GitHub!"
    fi
fi

echo "🎉 Sync complete!"

