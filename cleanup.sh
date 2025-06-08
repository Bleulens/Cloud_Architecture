#!/usr/bin/env bash

# 📌 Set workspace folder (fallback to current directory if undefined)
WORKSPACE_FOLDER="${WORKSPACE_FOLDER:-$(pwd)}"

echo "🚀 Starting cleanup process..."

# 1️⃣ Remove Terraform's local cache directory if it exists
if [ -d ".terraform" ]; then
    echo "🧹 Removing .terraform directory..."
    rm -rfv .terraform
fi

# 2️⃣ Delete Terraform plan file if it exists
if [ -f "tfplan" ]; then
    echo "🗑 Removing tfplan..."
    rm tfplan
fi

# 3️⃣ Clear logs to declutter workspace (checks if logs folder exists)
if [ -d "${WORKSPACE_FOLDER}/logs" ]; then
    echo "🗑 Cleaning up logs..."
    rm -rfv "${WORKSPACE_FOLDER}/logs/*"
else
    echo "🤷 No logs directory found—skipping log cleanup."
fi

echo "✅ Cleanup complete!"