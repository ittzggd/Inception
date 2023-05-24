FROM	debian:buster

RUN		apt-get update -y && \
		apt-get upgrade -y && \
		apt-get -y install mariadb-server 

WORKDIR	/tmp/mariadb

COPY	../tools/entrypoint.sh	/tmp/mariadb/entrypoint_test.sh
COPY	../conf/mariadb.conf	/etc/mysql/mariadb.conf.d/
COPY	../../.env				./

CMD		sleep10

ENTRYPOINT ["sh", "entrypoint_test.sh"]
