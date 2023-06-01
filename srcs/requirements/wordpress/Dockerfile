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

# RUN		wget https://wordpress.org/latest.tar.gz && \
# 		tar -xvf latest.tar.gz && \
# 		mv /wordpress/*	/var/www/html/ && \
# 		chown -R www-data:www-data /var/www/html && \
# 		rm -r /wordpress latest.tar.gz

# #RUN		mkdir /var/www/html
# RUN		mv /wordpress/	/var/www/html
# RUN		chown -R www-data:www-data	/var/www/html
# RUN		rm -r /wordpress/wordpress latest/tar/gz
RUN  curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	 chmod +x wp-cli.phar && \
     mv wp-cli.phar /usr/local/bin/wp

#RUN  mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

#COPY	/requirements/wordpress/conf/wp-config.php	/var/www/html/wp-config.php
COPY	/requirements/wordpress/conf/www.conf			 /etc/php/7.3/fpm/pool.d/www.conf
COPY	/requirements/wordpress/tools/entrypoint.sh		/entrypoint.sh

RUN chmod +x /entrypoint.sh
# CMD ["sleep", "10"]
# CMD ["service", "php7.3-fpm", "start"]

RUN service php7.3-fpm start

ENTRYPOINT ["sh", "/entrypoint.sh"]
