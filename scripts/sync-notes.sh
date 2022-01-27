#!/usr/bin/env bash

cd ~/Documents/ObsidianNotes/Tom

echo "$(date): Starting sync notes..."

git add -A
git commit -m "Automated commit from sync-notes.sh"
git push

echo "$(date): Sync notes complete!"
