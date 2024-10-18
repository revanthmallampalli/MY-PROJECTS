#!/bin/bash
echo "System Information:"
echo "Hostname: $(hostname)"
echo "Uptime: $(uptime -p)"
echo "Memory Usage: "
free -h
echo "Disk Usage: "
df -h
