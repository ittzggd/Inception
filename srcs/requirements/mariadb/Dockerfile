From debian:buster

ARG db_name
ARG user_name
ARG user_pw

ENV DB_NAME=$db_name
ENV USER_NAME=$user_name
ENV USER_PW=$user_pw

RUN apt-get update -y && \
    apt-get -y install mariadb-server

COPY	/requirements/mariadb/conf/mariadb.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

# COPY	/requirements/mariadb/conf/mariadb.cnf	/etc/mysql/my.cnf

RUN touch /setdb.sql && \
    echo "CREATE DATABASE $DB_NAME;" > /setdb.sql && \
    echo "CREATE USER '$USER_NAME'@'%' IDENTIFIED BY '$USER_PW';" >> /setdb.sql && \
    echo "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$USER_NAME'@'%';" >> /setdb.sql && \
    echo "FLUSH PRIVILEGES;" >> /setdb.sql

RUN service mysql start && mysql < /setdb.sql

CMD ["mysqld"]


# FROM	debian:buster

# RUN apt-get -y update && \
# 	apt-get -y install mariadb-server


# WORKDIR	/tmp/mariadb

# COPY	/requirements/mariadb/tools/entry.sh	/tmp/mariadb/entry.sh
# COPY	/requirements/mariadb/conf/mariadb.cnf	/etc/mysql/my.cnf

# RUN	chmod -R 777 /var/lib/mysql
# RUN chown -R mysql:mysql /var/lib/mysql

# #RUN		chmod 777 /tmp/mariadb/entrypoint.sh

# EXPOSE 	3306

# #CMD		["service", "mysql", "start"]
# ENTRYPOINT ["sh", "entry.sh"]
