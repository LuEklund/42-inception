FROM debian:bullseye

RUN apt-get update && apt-get install -y nginx openssl

RUN mkdir -m 775 /etc/nginx/ssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-keyout /etc/nginx/ssl/certificate.key \
	-out /etc/nginx/ssl/certificate.crt \
	-subj "/C=FI/ST=Helsinki/L=Helsiniki/O=Hive/OU=leklund/CN=leklund/"

COPY tools/default /etc/nginx/sites-available/default
COPY tools/nginx.conf /etc/nginx/nginx


EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
