FROM alpine

RUN apk update && \
      apk add --no-cache \
      mysql-client xz outils-md5

ADD backup-db.sh /backup-db.sh

CMD ["/backup-db.sh"]
