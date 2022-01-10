FROM debian:buster

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y php7.3-fpm php7.3-mysql php7.3-cgi curl
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod 777 wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/
WORKDIR /var/www/wordpress
RUN wp core download --allow-root
RUN chown -R www-data:www-data *
RUN chmod -R 777 *
RUN service php7.3-fpm start;
RUN service php7.3-fpm stop;
COPY ./tools/start_wordpress.sh /

CMD ["bash", "/start_wordpress.sh"]