FROM	debian:buster


#apt-get update: 설치되어있는 패키지들의 새로운 버전 있는지 확인
#apt-get upgrade: 위에서 확인한 패키지들의 최신 버전에 따라 패키지들의 버전을 업드레이드해줌
RUN		apt-get update -y &&
		apt-get upgrade -y &&\
		apt-get -y install nginx \
		openssl

RUN		openssl req x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/sesrver_pkey.pem -out /etc/ssl/certs/server.crt  
RUN		chown -R www-data:www-data /var/lib/nginx
RUN 	echo "\n daemon off;">> /etc/nginx/nginx.conf

EXPOSE	443

COPY 