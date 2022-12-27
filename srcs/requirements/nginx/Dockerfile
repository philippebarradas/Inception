FROM	debian:buster

RUN	apt update -y && apt upgrade -y \
	&& apt install nginx -y

RUN	apt install openssl -y \
	&& mkdir /etc/nginx/ssl \
	&& openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=PARIS/L=Paris/O=42/OU=phbarrad/CN=phbarrad.42.fr" 

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

EXPOSE 443

ENTRYPOINT ["nginx", "-g", "daemon off;"]
