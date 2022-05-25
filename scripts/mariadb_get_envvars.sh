#!/usr/bin/env sh

grep DATABASE_URL /home/dokku/$1/ENV > /tmp/mariadb_info

db_host="$(grep -o -P '(?<=@).*(?=\/)' /tmp/mariadb_info)"
db_name="$(grep -o -P '(?<=\d\/).*(?=")' /tmp/mariadb_info)"
db_user=mariadb
db_password="$(grep -o -P '(?<=mariadb:).*(?=@)' /tmp/mariadb_info)"

dokku config:set $1 WORDPRESS_DB_HOST=$db_host WORDPRESS_DB_NAME=$db_name WORDPRESS_DB_USER=$db_user WORDPRESS_DB_PASSWORD=$db_password
