#A simple script to backup a directory by copying its contents to another directory.


#!/bin/bash

# Define source and destination directories
SOURCE="/path/to/source"
DESTINATION="/path/to/backup"

# Check if the destination directory exists; if not, create it
if [ ! -d "$DESTINATION" ]; then
  mkdir -p "$DESTINATION"
fi

# Copy files from source to destination
cp -r $SOURCE/* $DESTINATION/

# Print a message indicating the backup is complete
echo "Backup completed successfully!"
