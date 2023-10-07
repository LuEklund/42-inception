#! /bin/bash

chown -R www-data:www-data /var/www/html
chmod -R 775 /var/www/html

if [ -f "wp-config.php" ]; then
	echo "WordPress: already installed"
else

	wp core download --allow-root

	wp config create --allow-root \
			--dbhost=${DB_HOST} \
			--dbname=${DB_NAME} \
			--dbuser=${DB_USER} \
			--dbpass=${DB_PASSWORD}

	#install and configure wordpress and create a new user
	wp core install --url=${DOMAIN_NAME} \
					--title=${WP_TITLE} \
					--admin_user=$WP_ADMIN_USER \
					--admin_password=$WP_ADMIN_PASSWORD \
					--admin_email=$WP_ADMIN_EMAIL \
					--skip-email \
					--allow-root

	wp user create  $WP_USER \
					$WP_USER_EMAIL \
					--role=author \
					--user_pass=$WP_USER_PASSWORD \
					--allow-root
	
	#Install a theme
	wp theme install inspiro --activate --allow-root
	echo Finished installation and setup!

fi

#start the PHP-FPM (FastCGI Process Manager) service for PHP version 7.4 in foreground mode
/usr/sbin/php-fpm7.4 -R -F