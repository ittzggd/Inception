#!/bin/bash
sleep 10

# curl -0 https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
# chmod +x wp-cli.phar 
# mv wp-cli.phar /usr/local/bin/wp

set -e

host=mariadb
port=3306

#cd /var/www

# wp --allow-root core download --locale=ko_KR  --path=/var/www/html --force

# #cp /tmp/wp-config.php /var/www/html
# #wp --allow-root config create --locale=ko_KR  --dbname=$DB_NAME --dbuser=$DB_USER_NAME --dbpass=$DB_USER_PW --dbhost=$host:$port --path=/var/www/html --force

# wp --allow-root core install --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_AUSER --admin_password=$WP_APW  --admin_email=$WP_AEMAIL --skip-email

# wp --allow-root user create $WP_USER $WP_EMAIL --user_pass=$WP_PW || echo "User already exists."

# #service php7.3-fpm start
# php-fpm7.3 -F

# wp core is-installed
#if ! wp core is-installed; then

wp --allow-root core download  --path=/var/www/html

wp --allow-root config create --dbname=$DB_NAME --dbuser=$DB_USER_NAME --dbpass=$DB_USER_PW --dbhost=$host:$port  --path=/var/www/html 

wp --allow-root core install --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_AUSER --admin_password=$WP_APW  --admin_email=$WP_AEMAIL --skip-email 

wp --allow-root user create $WP_USER $WP_EMAIL --user_pass=$WP_PW 

#fi

exec php-fpm7.3 -F
