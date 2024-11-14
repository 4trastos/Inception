FROM debian:11

RUN apt -y update && apt -y upgrade && apt -y install nginx

RUN apt-get update && apt-get install -y openssl && mkdir -p /etc/nginx/ssl && \
	openssl req -x509 -nodes -days 365 -newkey rsa:4096 -out /etc/nginx/ssl/davgalle.42.fr.crt -keyout /etc/nginx/ssl/davgalle.42.fr.key -subj "/C=ES/ST=MADRID/L=MADRID/O=42/CN=davgalle.42.fr" && \
	mkdir -p /var/run/nginx

EXPOSE 443

COPY ./conf/default /etc/nginx/sites-available/.

CMD ["nginx", "-g", "daemon off;"]
