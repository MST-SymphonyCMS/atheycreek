#!/bin/bash

# Remote server info
client=atheycreek
remoteUser=athey
remoteHost=107.170.197.235
remotePort=22777

# Login to remote computer and run backup.
echo "Logging into $client"
echo
ssh -p "$remotePort" "$remoteUser"@"$remoteHost" "
  # Moving to the deploy folder
  echo "Moving to deploy folder"
  cd /var/www/"$client"

  # updating Git
  echo "Pulling from Git repository"
  git pull

  # Close the session
  exit;
"