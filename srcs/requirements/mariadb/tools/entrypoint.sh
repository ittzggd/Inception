#!/bin/sh

service mysql start
# mysql -u root -e  "FLUSH PRIVILEGES";
mysql -uroot -e "CREATE DATABASE ${DATABASE}";
mysql -uroot -e  "CREATE USER '$MYSQL_USER'@'localhost' IDENTIFIED BY '$MYSQL_PASSWORD'";
mysql -uroot -e "GRANT ALL ON $DATABASE.* TO $MYSQL_USER@'localhost'";
# # mysql -u root -e  "CREATE USER '$USER2'@'localhost' IDENTIFIED BY '$PASS2'";
# # mysql -u root -e "GRANT ALL ON $DB.* TO $USER2@'localhost'";
# mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY $DB_ROOT_PASSWORD";
mysql -uroot -e "ALTER USER root@localhost IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}'; FLUSH PRIVILEGES;"

mysqld
