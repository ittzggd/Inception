FROM	debian:buster

RUN		apt-get update -y &&
		apt-get upgrade -y &&\
		apt-get -y install nginx \
		openssl

RUN		openssl req x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/sesrver_pkey.pem -out /etc/ssl/certs/server.crt  
RUN		chown -R www-data:www-data /var/lib/nginx
RUN 	echo "\n daemon off;">> /etc/nginx/nginx.conf

EXPOSE	443

COPY 