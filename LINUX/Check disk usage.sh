#This script checks the disk usage and alerts if it's over a specified limit.

#!/bin/bash
THRESHOLD=80

# Get the disk usage as a percentage (exclude '%' symbol)
DISK_USAGE=$(df -h / | grep / | awk '{ print $5 }' | sed 's/%//g')

if [ $DISK_USAGE -gt $THRESHOLD ]; then
  echo "Warning: Disk usage is above ${THRESHOLD}%."
else
  echo "Disk usage is under control."
fi



# df -h /data:
# This command checks the disk usage for the /data filesystem instead of the root filesystem (/).

# | grep /data:
# Filters the output to include only the line related to the /data filesystem.

# awk '{ print $5 }':
# Extracts the fifth column from the output, which contains the usage percentage.

# | sed 's/%//g':
# Removes the % symbol from the usage percentage.

# DISK_USAGE=$(...):
# Stores the final numeric value (without %) in the variable DISK_USAGE.

