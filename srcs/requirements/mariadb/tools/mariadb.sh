#!/bin/bash

# use heredoc to pass multiple commands to mysql daemon
# create a new database and a new user with all privileges on that database
# change the root password
# start the mysql server

chown -R mysql:mysql /var/lib/mysql

<< EOF mysqld --bootstrap --datadir=/var/lib/mysql --user=mysql
USE mysql;
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';

CREATE DATABASE ${MYSQL_NAME} CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED by '${MYSQL_PASSWORD}';
GRANT ALL PRIVILEGES ON ${MYSQL_NAME}.* TO '${MYSQL_USER}'@'%';


FLUSH PRIVILEGES;
EOF

mysqld_safe
