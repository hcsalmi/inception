FROM debian:bullseye

RUN apt-get update && apt-get install -y mariadb-server mariadb-client

EXPOSE 3306

WORKDIR /

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
RUN chmod 644 /etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./tools/mariadb.sh /
RUN chmod +x ./mariadb.sh

CMD ["./mariadb.sh"]
