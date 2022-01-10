#!/bin/bash

service mysql start
envsubst < /create_database.sql | mysql
mysqladmin -u root password "$DB_ROOT_PASSWORD"
service mysql stop

mysqld