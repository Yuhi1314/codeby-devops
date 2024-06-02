FROM alpine:latest

RUN apk -U add nginx \ 
&& mkdir -p /opt/www/ \
&& touch /opt/www/index.html
ADD nginx.conf /etc/nginx/nginx.conf

CMD nginx
