#!/bin/bash

set -euo pipefail

docker exec --user www-data nextcloud php occ maintenance:mode --on

docker_volume=$(docker volume create)

docker build -t mysql-backup /opt/nextcloud/mysql
docker run --rm -v ${docker_volume}:/backups \
    --network nextcloud_internal \
    -e MYSQL_HOST=nextcloud_mariadb \
    -e MYSQL_DUMP_TARGET=/backups \
    -e MYSQL_DATABASE=ncdb \
    --env-file=/home/daan/.secrets/nc_db_user \
    -t \
    mysql-backup

# no idea what folders to backup, so nothing for now
# docker build -t backup-nc /opt/backup/backup-nc
# docker run --rm -v ${docker_volume}:/backups -v nextcloud_nextcloud:/nextcloud \
#          backup-nc

docker run --rm -v ${docker_volume}:/backups \
    --env-file=/home/daan/.secrets/nc_s3 \
    amazon/aws-cli s3 --endpoint-url 'https://s3.eu-central-1.wasabisys.com' cp --recursive /backups s3://nextcloud-volume-backup/backups

docker exec --user www-data nextcloud php occ maintenance:mode --off

docker volume rm ${docker_volume}