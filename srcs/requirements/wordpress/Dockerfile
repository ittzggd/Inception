FROM	debian:buster

RUN		apt-get update -y && \
		apt-get upgrade -y && \
		apt-get -y install mariadb-client

RUN		apt-get update -y && \
		apt-get upgrade -y && \
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

RUN		mkdir -p /var/www/html
RUN 	chown -R www-data:www-data /var/www/html

WORKDIR /var/www/html

RUN  curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	 chmod +x wp-cli.phar && \
     mv wp-cli.phar /usr/local/bin/wp

COPY	/requirements/wordpress/conf/www.conf			 /etc/php/7.3/fpm/pool.d/www.conf
COPY	/requirements/wordpress/tools/entrypoint.sh		/entrypoint.sh

RUN chmod +x /entrypoint.sh

RUN service php7.3-fpm start

ENTRYPOINT ["sh", "/entrypoint.sh"]
