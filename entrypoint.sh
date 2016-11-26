#!/bin/bash -e

envsubst < /templates/sql.template > /etc/proftpd/sql.conf
envsubst < /templates/proftpd.template > /etc/proftpd/proftpd.conf
envsubst < /templates/modules.template > /etc/proftpd/modules.conf

exec proftpd --nodaemon
