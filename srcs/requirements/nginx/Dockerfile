FROM	debian:buster


RUN		apt-get update -y && \
		apt-get upgrade -y && \
		apt-get -y install nginx openssl


RUN		openssl req -newkey rsa:4096 -days 365 -nodes -x509 -keyout localhost.dev.key -out localhost.dev.crt \
 		-subj "/C=KR/ST=Seoul/L=Seoul/O=42Seoul/OU=Lee"
RUN		mv localhost.dev.crt /etc/ssl/certs/
RUN		mv localhost.dev.key /etc/ssl/private/
RUN		chmod 700 /etc/ssl/certs/localhost.dev.crt /etc/ssl/private/localhost.dev.key


RUN		chown -R www-data:www-data /var/www/html



EXPOSE	443

COPY	 /requirements/nginx/conf/nginx.conf	/etc/nginx/conf.d/nginx.conf
COPY	/requirements/nginx/tools/entrypoint.sh	/tmp/nginx/entrypoint.sh


ENTRYPOINT ["sh", "/tmp/nginx/entrypoint.sh"]