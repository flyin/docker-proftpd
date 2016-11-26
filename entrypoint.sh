#!/bin/bash -e

sed -i "s/SQLConnectInfo XXX/SQLConnectInfo $PROFTPD_DATABASE_NAME@$PROFTPD_DATABASE_HOST $PROFTPD_DATABASE_USER $PROFTPD_DATABASE_PASSWORD/" /etc/proftpd/sql.conf

# TODO: Check connect to mysql database

exec proftpd --nodaemon
