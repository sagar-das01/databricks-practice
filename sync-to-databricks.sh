#!/bin/bash

# Sync notebooks from local Git repository to Databricks
# Usage: ./sync-to-databricks.sh

set -e

# Configuration
DATABRICKS_USER_PATH="/Users/sagarrdass@outlook.com/databricks-practice"

echo "🔄 Syncing notebooks from local to Databricks..."

# Import specific notebook
echo "📤 Importing practice-notebook-1..."
databricks workspace import practice-notebook-1.py \
  "${DATABRICKS_USER_PATH}/practice-notebook-1" \
  --language PYTHON \
  --format SOURCE \
  --overwrite

echo "✅ Import complete!"
echo "🎉 Sync to Databricks complete!"

