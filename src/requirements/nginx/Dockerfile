FROM debian:11

RUN apt -y update && apt -y upgrade && apt -y install nginx

RUN apt-get -y install iputils-ping

RUN apt-get update && apt-get install -y openssl && mkdir -p /etc/nginx/ssl && \
	openssl req -x509 -nodes -days 365 -newkey rsa:4096 -out /etc/nginx/ssl/davgalle.42.fr.crt -keyout /etc/nginx/ssl/davgalle.42.fr.key -subj "/C=ES/ST=MADRID/L=MADRID/O=42/CN=davgalle.42.fr" && \
	mkdir -p /var/run/nginx

#COPY ./conf/default /etc/nginx/sites-available/.
COPY conf/nginx.conf /etc/nginx/sites-available/nginx.conf

RUN ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/

RUN chmod 755 /var/www/html && chown -R www-data:www-data /var/www/html

CMD ["nginx", "-g", "daemon off;"]
