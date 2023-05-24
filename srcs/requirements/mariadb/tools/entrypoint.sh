#!/bin/bash

service mysql start

# https://stackoverflow.com/questions/2428416/how-to-create-a-database-from-shell-command


mysql -u root -e "CREATE DATABASE $DB";
mysql -u root -e  "CREATE USER '$USER1'@'localhost' IDENTIFIED BY '$PASS1'";
mysql -u root -e "GRANT ALL ON $DB.* TO $USER1@'localhost'";
mysql -u root -e  "CREATE USER '$USER2'@'localhost' IDENTIFIED BY '$PASS2'";
mysql -u root -e "GRANT ALL ON $DB.* TO $USER2@'localhost'";
mysql -u root -e  "FLUSH PRIVILEGES";

sleep 1000000;