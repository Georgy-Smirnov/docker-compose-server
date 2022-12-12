FROM debian:latest
RUN apt-get update && apt-get upgrade -y
#NGINX
RUN apt-get install -y nginx && apt-get install -y vim && apt-get install -y wget
RUN sed -i 's/index index.html index.htm index.nginx-debian.html;/index index.php index.html index.nginx-debian.html;/g' /etc/nginx/sites-available/default && \
    sed -i 's/server_name _;/server_name localhost;/g' /etc/nginx/sites-available/default && \
    sed -i 's/#location ~ \\.php$ {/location ~ \\.php$ {/g' /etc/nginx/sites-available/default && \
    sed -i "s/#\tinclude snippets\/fastcgi-php.conf;/\tinclude snippets\/fastcgi-php.conf;/g" /etc/nginx/sites-available/default && \
    sed -i "s/#\tfastcgi_pass unix:\/run\/php\/php7.4-fpm.sock;/\tfastcgi_pass unix:\/run\/php\/php7.4-fpm.sock;/g" /etc/nginx/sites-available/default && \
    sed -i "63 s/#}/}/" /etc/nginx/sites-available/default
#PHPMYADMIN
RUN apt-get install -y php7.4 php7.4-fpm php7.4-mysql
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.2.0/phpMyAdmin-5.2.0-all-languages.tar.gz
RUN tar -xf phpMyAdmin-5.2.0-all-languages.tar.gz && rm -f phpMyAdmin-5.2.0-all-languages.tar.gz
RUN mv phpMyAdmin-5.2.0-all-languages/ /var/www/html/phpmyadmin/
RUN cp /var/www/html/phpmyadmin/config.sample.inc.php /var/www/html/phpmyadmin/config.inc.php
RUN chown -R www-data:www-data /var/www/html/phpmyadmin/
#MYSQL
RUN apt-get install -y default-mysql-server
COPY ./service_start.sh /
RUN chmod 777 /service_start.sh
