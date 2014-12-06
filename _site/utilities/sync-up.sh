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
localDbHost=localhost
localDbPass=Simkiss77

# Backup options
backupName=./"$dbName"_$(date +"%Y%m%d").sql.gz
backupSQLFile=./"$dbName"_$(date +"%Y%m%d").sql
downloadName=.

# Pull local SQL backup.
echo
echo "Taking a cut of your development database..."
mysqldump -u"$localUser" -p"$localDbPass" --opt -h"$localDbHost" "$localDb" | gzip -9 > "$backupName"

# Copy the local database backup from current computer to the remote host.
echo "Pushing the development cut to the server..."
scp -P "$remotePort" $backupName "$remoteUser"@"$remoteHost":/home/$remoteUser
rm $backupName
echo "About to restore the database..."
ssh -p "$remotePort" "$remoteUser"@"$remoteHost" "

       gunzip "$backupName"
       mysql "$dbName" -u "$dbUser" --password='"$dbPass"' < "$backupSQLFile"
       echo "OK, all finished here."
       echo ""
       echo "Now cleaning up the server..."
       rm "$backupSQLFile"
       echo "Clean up completed and the database has been deployed - have a nice day."
       exit;
"
