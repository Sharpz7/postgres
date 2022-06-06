#!/bin/sh

# Replace commas with spaces
SHARPDOMAINS=$(echo $SHARPDOMAINS | sed 's/,/ /g')

sed -i "s/XXXXX/$SHARPDOMAINS/g" /sharpnet/nginx.conf

./docker-entrypoint.sh postgres