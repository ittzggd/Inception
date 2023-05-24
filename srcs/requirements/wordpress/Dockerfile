FROM	debian:buster

RUN		apt-get update -y &&
		apt-get upgrade -y &&\
		apt-get -y install \
		php7.3 \
		php-fpm \
		php-cli \
		wget \
		curl \
		php-mysql \
		php-mbstring \
		php-xml \
		sendmail

RUN		wget https:://wordpress.org/latest.tar.gz
RUN		tar -xvf latest.tar.gz

RUN		mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

COPY	./conf/wp-config.php	/var/www/html/wp-config.php
COPY	./conf/www.conf			/etc/php/7.3/fpm/pool.d/www.conf


ENTRYPOINT ["sh", "entrypoint.sh"]