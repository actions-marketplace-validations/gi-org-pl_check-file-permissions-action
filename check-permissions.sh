#!/bin/sh
set -e

BASE_BRANCH="${1:-main}"

echo "Checking for file permission changes against $BASE_BRANCH..."

PERM_CHANGES=$(git diff "origin/$BASE_BRANCH"...HEAD --diff-filter=M --summary | grep 'mode change' || true)

if [ -n "$PERM_CHANGES" ]; then
  echo "❌ File permission changes detected:"
  echo "$PERM_CHANGES"
  exit 1
fi

echo "✅ No file permission changes found."
