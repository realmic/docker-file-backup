#!/bin/sh
rsync -a --delete /mnt/source/ /mnt/gluster/$BACKUP_NAME/`date +%m-%d-%Y`/
CUTOFF=$((`date +%s`-2592000))
find /mnt/gluster/$BACKUP_NAME/ -mindepth 1 -maxdepth 1 -print | while read BACKUP; do
  DATE=`echo $BACKUP | cut -d "/" -f 5`
  CORRECT=`echo $DATE | cut -d "-" -f 3`-`echo $DATE | cut -d "-" -f 1`-`echo $DATE | cut -d "-" -f 2`
  BACKUPDATE=`date +%s -d $CORRECT`
  if [ $BACKUPDATE -lt $CUTOFF ]
  then
    rm -rf $BACKUP
  fi
done
