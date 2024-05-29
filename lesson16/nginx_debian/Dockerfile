FROM debian:latest

RUN apt-get update && apt-get install -y nginx \ 
&& mkdir -p /opt/www/ \
&& touch /opt/www/index.html
ADD nginx.conf /etc/nginx/nginx.conf

ENTRYPOINT nginx
