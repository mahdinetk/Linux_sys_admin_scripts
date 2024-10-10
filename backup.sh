#!/bin/bash


#this is a script to backup every files in a director
#execute this script as root user

#you should customize the path of directory where you want to backup 
#and the destination directory Where you want to put the backup files


#Adjust the following paths as you want
BACKUP_DIR="/tmp/dir"
DEST_DIR="/mnt/backup"
BACKUPNAME=`date +%y-%m-%d-%H-%M`

cd $BACKUP_DIR

tar -czf $BACKUPNAME.tar.gz *

mkdir -p $DEST_DIR/$BACKUPNAME

mv $BACKUPNAME.tar.gz $DEST_DIR/$BACKUPNAME/

cd $DEST_DIR/$BACKUPNAME

tar -xzf $BACKUPNAME.tar.gz

rm $BACKUPNAME.tar.gz

echo "backup was successful"
