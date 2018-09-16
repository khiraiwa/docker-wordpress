#!/bin/bash

set -eo pipefail

DB_NAME=${DB_NAME//\//\\\/}
sed -i -e "s/__DB_NAME__/${DB_NAME:=hoge}/g" /wp-config.php
DB_USER=${DB_USER//\//\\\/}
sed -i -e "s/__DB_USER__/${DB_USER:=hoge}/g" /wp-config.php
DB_PASSWORD=${DB_PASSWORD//\//\\\/}
sed -i -e "s/__DB_PASSWORD__/${DB_PASSWORD:=hoge}/g" /wp-config.php
DB_HOST=${DB_HOST//\//\\\/}
sed -i -e "s/__DB_HOST__/${DB_HOST:=hoge}/g" /wp-config.php
DB_CHARSET=${DB_CHARSET//\//\\\/}
sed -i -e "s/__DB_CHARSET__/${DB_CHARSET:=hoge}/g" /wp-config.php
TABLE_PREFIX=${TABLE_PREFIX//\//\\\/}
sed -i -e "s/__TABLE_PREFIX__/${TABLE_PREFIX:=hoge}/g" /wp-config.php
AUTH_KEY=${AUTH_KEY//\//\\\/}
sed -i -e "s/__AUTH_KEY__/${AUTH_KEY:=hoge}/g" /wp-config.php
SECURE_AUTH_KEY=${SECURE_AUTH_KEY//\//\\\/}
sed -i -e "s/__SECURE_AUTH_KEY__/${SECURE_AUTH_KEY:=hoge}/g" /wp-config.php
LOGGED_IN_KEY=${LOGGED_IN_KEY//\//\\\/}
sed -i -e "s/__LOGGED_IN_KEY__/${LOGGED_IN_KEY:=hoge}/g" /wp-config.php
NONCE_KEY=${NONCE_KEY//\//\\\/}
sed -i -e "s/__NONCE_KEY__/${NONCE_KEY:=hoge}/g" /wp-config.php
AUTH_SALT=${AUTH_SALT//\//\\\/}
sed -i -e "s/__AUTH_SALT__/${AUTH_SALT:=hoge}/g" /wp-config.php
SECURE_AUTH_SALT=${SECURE_AUTH_SALT//\//\\\/}
sed -i -e "s/__SECURE_AUTH_SALT__/${SECURE_AUTH_SALT:=hoge}/g" /wp-config.php
LOGGED_IN_SALT=${LOGGED_IN_SALT//\//\\\/}
sed -i -e "s/__LOGGED_IN_SALT__/${LOGGED_IN_SALT:=hoge}/g" /wp-config.php
NONCE_SALT=${NONCE_SALT//\//\\\/}
sed -i -e "s/__NONCE_SALT__/${NONCE_SALT:=hoge}/g" /wp-config.php

mv /wp-config.php /var/www/html/wp-config.php

case "$1" in
    wordpress)
        /usr/local/bin/docker-entrypoint.sh php-fpm
        exit 0
        ;;

    help)
        echo "nothing."
        exit 0
        ;;
esac

exec "$@"
