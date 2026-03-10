#!/bin/bash
# Cleanup stale sessions helper
# Part of OpenClaw Agent Optimization

SESSION_DIR="/Users/macstudio001/.openclaw/agents/opencode/sessions"
STALE_THRESHOLD_DAYS=7
DRY_RUN=${1:-"--dry-run"}

find "$SESSION_DIR" -name "*.jsonl" -mtime +$STALE_THRESHOLD_DAYS | while read -r file; do
    if [[ "$DRY_RUN" == "--dry-run" ]]; then
        echo "[DRY-RUN] Would remove: $file"
    else
        rm "$file"
        echo "[CLEANED] Removed: $file"
    fi
done

echo "Cleanup complete"