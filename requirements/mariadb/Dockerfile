FROM debian:11

RUN apt -y update && apt -y upgrade && apt install -y mariadb-server

COPY 50-server.cnf /etc/mysql/mariadb.conf.d/.
COPY init.sql /etc/mysql/init.sql
COPY script.sh .

RUN mkdir /run/mysqld && chmod +x script.sh

CMD ["mysqld_safe"]
CMD ["./script.sh"]
