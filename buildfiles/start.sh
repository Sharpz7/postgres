#!/bin/sh

chown -R postgres:postgres /data/postgres

# Replace commas with spaces
SHARPDOMAINS=$(echo $SHARPDOMAINS | sed 's/,/ /g')

sed -i "s/XXXXX/$SHARPDOMAINS/g" /sharpnet/nginx.conf

exec runuser -u postgres "./usr/local/bin/docker-entrypoint.sh postgres"