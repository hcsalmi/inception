FROM debian:bullseye

RUN apt-get update && \
apt-get install -y php-fpm php-mysql mariadb-client wget && \
mkdir -p /run/php && mkdir -p /var/www/html

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp && wp --info

COPY ./tools/init_wordpress.sh /

RUN chmod +x /init_wordpress.sh

WORKDIR /var/www/html

CMD ["/init_wordpress.sh"]
