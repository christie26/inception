#!/bin/sh

# wait for mariadb
while ! mariadb -h"$MYSQL_HOST" -u"$WP_DB_USR" -p"$WP_DB_PWD" "$WP_DB_NAME" > /dev/null 2>&1; do
    sleep 5
done

if [ ! -f "/var/www/html/index.php" ] ||  ! echo "Wordpress already installed"; then

    echo "Creating worpdress..."
    echo "$WP_ADMIN_USR $WP_ADMIN_PWD"
    wp core download --allow-root --path=/var/www/html
    wp config create --dbname="$WP_DB_NAME" --dbuser="$WP_DB_USR" --dbpass="$WP_DB_PWD" --dbhost="$MYSQL_HOST" --dbcharset="utf8" --dbcollate="utf8_general_ci" --allow-root --path=/var/www/html
    wp core install --title="$WP_TITLE" --admin_user="$WP_ADMIN_USR" --admin_password="$WP_ADMIN_PWD" --admin_email="$WP_ADMIN_EMAIL" --skip-email --allow-root --path=/var/www/html
    wp user create "$WP_USR" "$WP_USR_EMAIL" --role=author --user_pass="$WP_USR_PWD" --allow-root --path=/var/www/html
    # https://make.wordpress.org/cli/handbook/guides/quick-start/#practical-examples

    wp theme install twentytwentyone --activate --allow-root --path=/var/www/html
    # https://wordpress.org/themes/twentytwentyone/

    wp plugin update --all --allow-root --path=/var/www/html
    # https://make.wordpress.org/cli/handbook/references/config/

fi

echo "Wordpress ready!"

# start PHP FPM
/usr/sbin/php-fpm81 -F -R
