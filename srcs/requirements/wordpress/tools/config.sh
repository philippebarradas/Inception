#!/bin/bash

sleep 5

if [ -e "/var/www/wordpress/wp-config.php" ]
then
	echo "wordpress config already created"
else
	wp config create \
	--dbname=$MYSQL_DB --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD \
	--dbhost=mariadb:3306 --path="/var/www/wordpress" --allow-root

	wp core install \
	--allow-root --url="https://phbarrad.42.fr" --title="phbarrad.42.fr" \
	--admin_user=$WP_ADMIN --admin_email=$WP_ADMIN_MAIL \
	--admin_password=$WP_ADMIN_PASSWORD \
	--path="/var/www/wordpress"

	wp user create	\
	$WP_USER $WP_USER_MAIL --user_pass=$WP_USER_PASSWORD \
	--role="editor" --allow-root --path="/var/www/wordpress"

fi

exec "$@"
