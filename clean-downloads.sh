#!/bin/bash

# --- Configuration ---
# Define your download dir path
DOWNLOADS_DIR="$HOME/Downloads"
# Define the amount of days of inactivity. +14 means 'more than 14 days without modications'.
DAYS_OLD="+14"

echo "Searching files in $DOWNLOADS_DIR with $DAYS_OLD of inactivity..."
echo "--------------------------------------------------------------------------------"

find "$DOWNLOADS_DIR" -mtime $DAYS_OLD -delete

echo "Done"
