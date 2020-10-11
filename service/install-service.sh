#!/bin/bash

mkdir -p /opt/nextcloud/

cp -r ../mysql ../backup-nc /opt/nextcloud
cp ../run.sh /opt/nextcloud/backup
cp nc-backup.service /etc/systemd/system/
cp nc-backup.timer /etc/systemd/system/

systemctl enable nc-backup.timer