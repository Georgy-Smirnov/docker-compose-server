#!/bin/bash

wp config create --allow-root --skip-check --path=/var/www/wordpress --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASSWORD --dbhost=$DB_HOST --dbprefix=wp_
wp core install --allow-root --path=/var/www/wordpress --url=$WP_URL --title=hello --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL
wp user create second second@example.com --role=author --allow-root --user_pass=pass

/usr/sbin/php-fpm7.3 -F