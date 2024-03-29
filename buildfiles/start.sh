#!/bin/sh

chown -R postgres:postgres /data/postgres

# Replace commas with spaces
SHARPDOMAINS=$(echo $SHARPDOMAINS | sed 's/,/ /g')

sed -i "s/XXXXX/$SHARPDOMAINS/g" /sharpnet/nginx.conf

./usr/local/bin/docker-entrypoint.sh postgres