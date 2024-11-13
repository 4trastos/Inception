#!/bin/bash

cd /var/www/html

if [ ! -f wp-config.php ]; then
    echo "WordPress no está instalado. Procediendo con la instalación..."
    
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar
    
    ./wp-cli.phar core download --allow-root
    ./wp-cli.phar config create --dbname=wordpress --dbuser=wpuser --dbpass=password --dbhost=mariadb --allow-root
    ./wp-cli.phar core install --url=localhost --title=inception --admin_user=admin --admin_password=admin --admin_email=admin@admin.com --allow-root
else
    echo "WordPress ya está instalado. Omitiendo instalación."
fi

php-fpm8.2 -
