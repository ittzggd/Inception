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


RUN touch /setdb.sql && \
    echo "CREATE DATABASE $DB_NAME;" > /setdb.sql && \
    echo "CREATE USER '$USER_NAME'@'%' IDENTIFIED BY '$USER_PW';" >> /setdb.sql && \
    # echo "CREATE USER 'root'@'localhost' IDENTIFIED BY '$USER_PW';" >> /setdb.sql && \
    echo "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$USER_NAME'@'%';" >> /setdb.sql && \
    echo "FLUSH PRIVILEGES;" >> /setdb.sql

RUN service mysql start && mysql < /setdb.sql

CMD ["mysqld"]
