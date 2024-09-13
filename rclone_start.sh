#!/bin/sh -e

# This script run on startup to mount the 2 onedrives account
# using rclone
#
# They will run as daemon in the background

# Check if there is an internet connection
# If there is no network, the script will wait until there is one
while
  ! ping -c 1 google.com >&/dev/null
do
  echo "No network found. Will retry in .5 seconds"
  sleep 1
done

# Mount onedrive_wit
rclone mount --daemon --vfs-cache-mode full onedrive_wit:Graduate ~/OneDrive/wit

# Mount onedrive_personal
rclone mount --daemon --vfs-cache-mode full onedrive_personal: ~/OneDrive/personal
