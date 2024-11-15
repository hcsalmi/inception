#!/bin/bash

chown -R www-data:www-data /var/www/html
chmod -R 775 /var/www/html

if [ ! -f ./wp-config.php ]; then

    wp core download    --allow-root

    # Create a new wp-config.php
    wp config create    --allow-root \
                        --dbhost=${MYSQL_HOST} \
                        --dbname=${MYSQL_NAME} \
                        --dbuser=${MYSQL_USER} \
                        --dbpass=${MYSQL_PASSWORD} \

    # Install and configure wordpress
    wp core install     --allow-root \
                        --url=${DOMAIN_NAME} \
                        --title=${WP_TITLE} \
                        --admin_user=${WP_ADMIN_USER} \
                        --admin_password=${WP_ADMIN_PASSWORD} \
                        --admin_email=${WP_ADMIN_EMAIL} \
                        --skip-email

    # Create a user for wordpress
    wp user create      --allow-root \
                        $WP_USER \
                        $WP_USER_EMAIL \
                        --role=author \
                        --user_pass=${WP_PASSWORD} \

    #Install a theme
	wp theme install inspiro --activate --allow-root

	echo Wordpress at your service!

fi

#start the FastCGI service (PHP-FPM) in foreground mode
/usr/sbin/php-fpm7.4 -R -F
