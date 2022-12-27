FROM debian:buster

RUN apt -y update && \
	apt -y upgrade && \
	apt -y install	\
	wget \
	php \
	php-common \
	php7.3-fpm \
	php-mysql \
	mariadb-client

RUN wget http://wordpress.org/latest.tar.gz -P /var/www
RUN cd /var/www && tar -xzf latest.tar.gz && rm latest.tar.gz

RUN chown -R root:root /var/www/wordpress
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

RUN mkdir -p /run/php

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp


COPY /tools /scripts
RUN chmod +x -R /scripts 

ENTRYPOINT ["/scripts/config.sh"]

CMD ["/usr/sbin/php-fpm7.3", "-F"]
