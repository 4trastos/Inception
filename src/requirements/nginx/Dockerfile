FROM debian:11

RUN apt -y update && apt -y upgrade && apt -y install nginx

COPY ./conf/default /etc/nginx/sites-available/.

CMD ["nginx", "-g", "daemon off;"]
