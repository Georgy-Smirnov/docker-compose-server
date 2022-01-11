#!/bin/bash

if ! [ -d /var/lib/mysql/wordpress ] ; then 
service mysql start
envsubst < /create_database.sql | mysql
mysqladmin -u root password "$DB_ROOT_PASSWORD"
service mysql stop
fi
chown -R mysql:mysql /var/lib/mysql
/usr/bin/mysqld_safe
