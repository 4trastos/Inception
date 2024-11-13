FROM debian:11

RUN apt -y update && apt -y upgrade && apt install -y mariadb-server

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/.
COPY ./tools/init.sql /etc/mysql/init.sql
COpy ./tools/script.sh .

RUN mkdir /run/mysqld && chmod +x script.sh

CMD ["mysqld_safe"]
CMD ["./script.sh"]

