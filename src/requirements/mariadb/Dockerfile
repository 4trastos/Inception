FROM debian:11

RUN apt -y update && apt -y upgrade && apt install -y mariadb-server

RUN apt -y install iputils-ping

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/.
COPY ./tools/init.sql /etc/mysql/init.sql
COPY ./tools/script.sh /usr/local/bin/.

RUN mkdir -p /run/mysqld && chmod +x /usr/local/bin/script.sh && chown -R mysql:mysql /run/mysqld && chmod 777 /run /run/mysqld && chown -R mysql:mysql /tmp /run

EXPOSE 3306

CMD ["mysqld_safe"]
CMD ["/bin/bash", "/usr/local/bin/script.sh"]
