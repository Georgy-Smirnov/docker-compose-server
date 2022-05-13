FROM debian:buster

RUN apt-get update
RUN apt-get upgrade -y
RUN	apt-get -y install wget
RUN	apt-get -y install openssl
RUN apt-get -y install nginx
RUN	apt-get -y install mariadb-server
RUN	apt-get -y install php7.3 php-mysql php-fpm php-pdo php-gd php-cli php-mbstring

COPY ./srcs/nginx_config /etc/nginx/sites-available/default

RUN openssl req -x509 -nodes -days 365 -subj "/CN=localhost" -newkey rsa:2048 -keyout /etc/ssl/nginx-selfsigned.key -out /etc/ssl/nginx-selfsigned.crt;

WORKDIR /var/www/html/

RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-english.tar.gz
RUN tar -xf phpMyAdmin-5.0.4-english.tar.gz && rm -rf phpMyAdmin-5.0.4-english.tar.gz
RUN mv phpMyAdmin-5.0.4-english phpmyadmin
COPY ./srcs/config.inc.php phpmyadmin

RUN wget https://wordpress.org/latest.tar.gz
RUN tar -xvzf latest.tar.gz && rm -rf latest.tar.gz
COPY ./srcs/wp-config.php /var/www/html/wordpress/

COPY ./srcs/script.sh /var/www/html/script.sh

EXPOSE 80 443

RUN chmod 755 script.sh
ENTRYPOINT ["/var/www/html/script.sh"]
