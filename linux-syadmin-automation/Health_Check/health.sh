#!/bin/bash

echo "System Health Check: Running..."

#Host name
echo "Host Name: $(hostname)"

#who has logged in
echo "Logged in Users: "
who

#time and date
echo "Current Date and Time: $(date)"

#uptime
echo "System Uptime: $(uptime)"

#file storage
echo "Disk Usage: " df -h

# ---- REPORT COMPLETE ----