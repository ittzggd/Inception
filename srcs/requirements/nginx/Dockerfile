FROM	debian:buster

WORKDIR /tmp/nginx

#apt-get update: 설치되어있는 패키지들의 새로운 버전 있는지 확인
#apt-get upgrade: 위에서 확인한 패키지들의 최신 버전에 따라 패키지들의 버전을 업드레이드해줌
RUN		apt-get update -y && \
		apt-get upgrade -y && \
		apt-get -y install nginx openssl

#RUN		mkdir /etc/ssl/private
#RUN		mkdir /etc/ssl/certs
RUN		openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/server_pkey.pem -out /etc/ssl/certs/server.crt \
		-subj "/C=KR/ST=Seoul/L=Seoul/O=42Seoul/OU=hejaaaaa"

RUN		chmod 666 /var/www/

RUN		chown -R www-data:www-data /var/lib/
#RUN 	echo "\n daemon off;">> /etc/nginx/nginx.conf
#RUN		["chown",  "-R",  "www-data:www-data",  "*"]

RUN 	chmod 600 /etc/ssl/certs/server.crt /etc/ssl/private/server_pkey.pem



EXPOSE	443

COPY	./conf/nginx.conf	/etc/nginx/sites-available/default
COPY	./tools/entrypoint.sh	/tmp/nginx/entrypoint.sh

#CMD	["service", "nginx", "start"]
CMD ["nginx", "-g", "daemon off;"]

#ENTRYPOINT ["sh", "/tmp/nginx/entrypoint.sh"]