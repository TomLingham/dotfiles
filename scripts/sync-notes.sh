#!/usr/bin/env bash

cd ~/Notes

echo "$(date): Starting sync notes..."

git add -A
git status
git commit -m "Automated commit from sync-notes.sh"
git push

echo "$(date): Sync notes complete!"
