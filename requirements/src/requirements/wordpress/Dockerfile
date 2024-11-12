FROM debian:11

RUN apt -y update && apt -y upgrade

RUN apt -y install lsb-release ca-certificates apt-transport-https software-properties-common wget gnupg2

RUN wget -qO /usr/share/keyrings/php.gpg https://packages.sury.org/php/apt.gpg

RUN echo "deb [signed-by=/usr/share/keyrings/php.gpg] https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php.list

RUN apt -y update && apt -y install php8.2-fpm php8.2-mysql

RUN mkdir -p /run/php/ && chown -R www-data:www-data /run/php/

COPY ./conf/www.conf /etc/php/8.2/fpm/pool.d/.

CMD ["php-fpm8.2", "-F"] 
