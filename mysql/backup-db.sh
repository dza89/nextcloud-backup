#!/bin/sh

# needs md5sum, xz, mysqldump
MYSQL_PASSWORD=${MYSQL_PASSWORD}
MYSQL_USER=${MYSQL_USER}
MYSQL_DATABASE=${MYSQL_DATABASE}
MYSQL_HOST=${MYSQL_HOST}
MYSQL_DUMP_TARGET=${MYSQL_DUMP_TARGET}

echo "starting backup at $(date +"%Y%m%d-%H%M%S")"
target=${MYSQL_DATABASE}_$(date +"%Y%m%d-%H%M%S").sql
mysqldump --single-transaction --max-allowed-packet=512M -A -h ${MYSQL_HOST} -u${MYSQL_USER} -p${MYSQL_PASSWORD} > ${MYSQL_DUMP_TARGET}/${target}
xz ${MYSQL_DUMP_TARGET}/${target}

echo "backup finished at $(date +"%Y%m%d-%H%M%S")"
