#!/bin/sh

# needs rsync, xz, tar

backup_name="nextcloud-dirbkp_$(date +"%Y%m%d")"

rsync -Aavx nextcloud/ /backups/${backup_name}/ 

tar cJvf nextcloud-dirbkp_$(date +"%Y%m%d").tar.xz /backups/${backup_name}

rm -rf /backups/${backup_name}

