FROM debian:bullseye

RUN apt update -y && \
	apt install php-fpm php-mysql mariadb-client wget -y && \
	mkdir -p /run/php && mkdir -p /var/www/html

COPY ./tools/www.conf /etc/php/7.4/fpm/pool.d/

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp && wp --info


COPY ./tools/config.sh /

RUN chmod +x /config.sh

WORKDIR /var/www/html

CMD [ "/config.sh" ]