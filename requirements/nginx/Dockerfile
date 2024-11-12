FROM debian:11

RUN apt -y update && apt -y upgrade && apt install -y nginx

COPY default /etc/nginx/sites-available/.

CMD ["nginx", "-g", "daemon off;"] 

