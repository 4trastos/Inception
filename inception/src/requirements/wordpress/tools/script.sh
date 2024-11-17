#!/bin/bash

cd /var/www/html

if [ ! -f wp-config.php ]; then
    echo "WordPress no está instalado. Procediendo con la instalación..."
    
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar
    
    ./wp-cli.phar core download --allow-root
    ./wp-cli.phar config create --dbname=wordpress --dbuser=wpuser --dbpass=password --dbhost=mariadb --allow-root
    ./wp-cli.phar core install --url=localhost --title=inception --admin_user=admin --admin_password=admin --admin_email=admin@admin.com --allow-root
    #./wp-cli.phar config create --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=$MYSQL_HOSTNAME --allow-root
    #./wp-cli.phar core install --url=$DOMAIN_NAME --title="$WORDPRESS_TITLE" --admin_user=$WORDPRESS_ADMIM --admin_password=$WORDPRESS_ADMIM_PASS  --admin_email=$WORDPRESS_ADMIM_EMAIL --skip-email --allow-root
    #./wp-cli.phar user create $WORDPRESS_USER $WORDPRESS_EMAIL --role=author --user_pass=$WORDPRESS_USER_PASS --allow-root
else
    echo "WordPress ya está instalado. Omitiendo instalación."
fi

php-fpm8.2 -F
