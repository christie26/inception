#!/bin/sh

# wait for mysql set
while ! mariadb -h"$MYSQL_HOST" -u"$WP_DB_USR" -p"$WP_DB_PWD" "$WP_DB_NAME" > /dev/null 2>&1; do
    sleep 5
done

if [ ! -f "/var/www/html/index.html" ]; then

    # adminer
    wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1-mysql-en.php -O /var/www/html/adminer.php > /dev/null 2>&1
    wget https://raw.githubusercontent.com/Niyko/Hydra-Dark-Theme-for-Adminer/master/adminer.css -O /var/www/html/adminer.css > /dev/null 2>&1

    wp core download --allow-root
    wp config create --dbname="$WP_DB_NAME" --dbuser="$WP_DB_USR" --dbpass="$WP_DB_PWD" --dbhost="$MYSQL_HOST" --dbcharset="utf8" --dbcollate="utf8_general_ci" --allow-root
    wp core install --url="$DOMAIN_NAME/wordpress" --title="$WP_TITLE" --admin_user="$WP_ADMIN_USR" --admin_password="$WP_ADMIN_PWD" --admin_email="$WP_ADMIN_EMAIL" --skip-email --allow-root
    wp user create "$WP_USR" "$WP_USR_EMAIL" --role=author --user_pass="$WP_USR_PWD" --allow-root
    wp theme install inspiro --activate --allow-root

    wp plugin update --all --allow-root

fi

echo "Wordpress started on :9000"

# start PHP FPM
/usr/sbin/php-fpm7 -F -R