FROM alpine

RUN apk add --no-cache rsync xz

ADD backup-nc.sh /backup-nc.sh

CMD ["/backup-nc.sh"]
