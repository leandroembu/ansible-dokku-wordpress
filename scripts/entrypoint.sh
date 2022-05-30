#!/bin/bash

set -e

PORT=${PORT:-5000}

rm -rf /app/wp-content/uploads
cp -r /app/* /var/www/html
cp /app/.htaccess /var/www/html
chown -R www-data:www-data /var/www/html/wp-content/uploads/

#sed -i "s/80/$PORT/g" /etc/apache2/sites-available/000-default.conf /etc/apache2/ports.conf

docker-entrypoint.sh "$@"
