FROM debian:bullseye


RUN apt-get update -y && apt-get install mariadb-server mariadb-client -y

COPY ./tools/50-server.cnf /etc/mysql/mariadb.conf.d/

RUN chmod 644 /etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./tools/script.sh /

WORKDIR /

RUN chmod +x ./script.sh

EXPOSE 3306

CMD ["/script.sh"]