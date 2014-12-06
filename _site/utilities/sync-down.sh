#!/bin/bash

# Remote server info
client=AtheyCreek
remoteUser=athey
remoteHost=107.170.197.235
remotePort=22777

# Remote DB Info
dbUser=atheycreek
dbPass=@th3yCr33k2014!
dbHost=localhost
dbName=atheycreek

# Local DB Info
localUser=root
localDb=atheycreek
localDbPass=Simkiss77

# Backup options
backupName=./"$dbName"_$(date +"%Y%m%d").sql.gz
backupSQLFile=./"$dbName"_$(date +"%Y%m%d").sql
downloadName=.

# Login to remote computer and run backup.
echo "Logging into $client"
echo
ssh -p "$remotePort" "$remoteUser"@"$remoteHost" "

       # Run the mysql backup
       echo "Cloning the production database…"
       mysqldump -u"$dbUser" -p"$dbPass"  -h"$dbHost" "$dbName" | gzip -9 > "$backupName"

       # Close the session
       exit;
"

# Copy the new database backup from remote host to current computer.
echo "Downloading $backupName clone to your computer..."
scp -P "$remotePort" "$remoteUser"@"$remoteHost":"$backupName" "$downloadName"
echo "Download complete."
echo "Now going to delete the $backupName clone on the production server…"
ssh -p "$remotePort" "$remoteUser"@"$remoteHost" "

       echo "Deleting the clone so we dont clutter the server.  This may take awhile…"
       rm "$backupName"
       echo "Backup file deleted"

       exit;
"
echo "Extracting the database clone..."
gunzip $backupName
echo "Restoring the production clone for you..."
mysql $localDb -u $localUser --password="$localDbPass" < $backupSQLFile
echo "Doing some housework..."
rm $backupSQLFile
echo "We're good to go"
echo
