FROM debian:buster

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get -y install mariadb-server
RUN apt-get install -y gettext-base
COPY ./conf/50-server.cnf etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./tools/create_database.sql /
COPY ./tools/start_mariadb.sh /

CMD ["bash", "/start_mariadb.sh"]