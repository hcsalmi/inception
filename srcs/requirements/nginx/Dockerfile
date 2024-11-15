FROM debian:bullseye

RUN apt-get update && apt-get install -y nginx openssl

RUN mkdir -m 775 /etc/nginx/ssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-keyout /etc/nginx/ssl/certificate.key \
	-out /etc/nginx/ssl/certificate.crt \
	-subj "/C=FI/ST=Helsinki/L=Helsinki/O=Hive/OU=lsalmi/CN=lsalmi"

COPY ./tools/default.conf /etc/nginx/conf.d/default.conf

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
