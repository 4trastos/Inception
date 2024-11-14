FROM debian:11

RUN apt -y update && apt -y upgrade

RUN apt-get -y install lsb-release ca-certificates apt-transport-https software-properties-common wget gnupg2

RUN apt-get install -y curl mariadb-client

RUN wget -qO /usr/share/keyrings/php.gpg https://packages.sury.org/php/apt.gpg

RUN echo "deb [signed-by=/usr/share/keyrings/php.gpg] https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php.list

RUN apt -y update && apt -y install php8.2-fpm php8.2-mysql

RUN mkdir -p /run/php/ && chown -R www-data:www-data /run/php/

COPY ./conf/www.conf /etc/php/8.2/fpm/pool.d/.

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp && mkdir -p /run/php && chmod 755 /run/php 

COPY ./tools/script.sh /usr/local/bin/script.sh

RUN chmod +x /usr/local/bin/script.sh

WORKDIR /var/www/html

EXPOSE 9000

CMD ["php-fpm8.2", "-F"]
CMD ["/bin/bash", "/usr/local/bin/script.sh"]

ENTRYPOINT ["/bin/bash", "/usr/local/bin/script.sh"]

#FROM debian:bullseye

#RUN apt-get update && apt-get upgrade -y 

#RUN apt-get install -y curl php7.4 php7.4-fpm php7.4-mysql mariadb-client

#COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/.
 
#RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

#RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp && mkdir -p /run/php && chmod 755 /run/php 

#COPY --chmod=755 ./tools/script.sh /usr/local/bin/script.sh

#WORKDIR /var/www/html

#CMD ["php-fpm7.4", "-F"]

#CMD ["/usr/local/bin/script.sh"]

#ENTRYPOINT ["/bin/bash", "/usr/local/bin/script.sh"]
