FROM debian:buster

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get -y install nginx
RUN	apt-get -y install openssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx.key -out /etc/ssl/certs/nginx.crt -subj "/C=RU/ST=Tatarstan/L=Kazan/CN=kjaco.42.fr"
COPY ./conf/nginx.conf /etc/nginx/sites-available/default

CMD ["nginx", "-g", "daemon off;"]