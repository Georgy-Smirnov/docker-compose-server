#!/bin/bash

echo "CREATE USER 'kjaco'@'%' IDENTIFIED BY '123';"| mysql -u root --skip-password
echo "GRANT ALL PRIVILEGES ON *.* TO 'kjaco'@'%';"| mysql -u root --skip-password
echo "FLUSH PRIVILEGES;"| mysql -u root --skip-password

service php7.4-fpm start
service mariadb start
service nginx start
