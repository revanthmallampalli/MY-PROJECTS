#This script finds files older than a specified number of days and deletes them

#!/bin/bash

DIRECTORY="/path/to/directory"  # Specify the directory to search
DAYS=30                          # Specify the number of days

# Check if the directory exists
if [ ! -d "$DIRECTORY" ]; then
  echo "Error: Directory $DIRECTORY does not exist."
  exit 1
fi

# List files that will be deleted (optional dry run)
echo "The following files will be deleted:"
find "$DIRECTORY" -type f -mtime +$DAYS

# Confirmation prompt before deletion
read -p "Are you sure you want to delete these files? (y/n): " CONFIRM
if [[ "$CONFIRM" != "y" ]]; then
  echo "Deletion aborted."
  exit 0
fi

# Find and delete files older than the specified number of days
find "$DIRECTORY" -type f -mtime +$DAYS -exec rm -f {} \;

# Print a message indicating completion
echo "Files older than $DAYS days have been deleted from $DIRECTORY."
