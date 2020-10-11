# nextcloud-backup

A script to backup the mysql database and the nextcloud data to s3

Requires some credentials:
db_creds_env_file=MYSQL_USER and MYSQL_PASSWORD
s3_creds_env_file=AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY
override_s3_endpoints=can be used to use another s3 compatible provider, like wasabi

Install as a service:
```bash
cd service
sudo bash ./install-service.sh
```