FROM debian:buster


RUN apt update -y 

RUN apt install php-fpm php-mysql mariadb-client -y

RUN apt install curl -y


COPY ./tools/config.sh /
RUN chmod +x /config.sh
COPY ./tools/www.conf /etc/php/7.3/fpm/pool.d/

RUN mkdir /run/php

CMD [ "/config.sh" ]