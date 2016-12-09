#!/bin/sh
rsync -a --delete /mnt/source/ /mnt/gluster/$BACKUP_NAME/`date +%m-%d-%Y`/
find /mnt/gluster/$BACKUP_NAME/ -maxdepth 1 -daystart -mtime +30 -exec rm -rf {} +
