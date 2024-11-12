FROM debian:11

RUN apt -y update && apt -y upgrade

# Instalar dependencias necesarias para agregar el repositorio PHP
RUN apt -y install lsb-release ca-certificates apt-transport-https software-properties-common wget gnupg2

# Agregar la clave GPG directamente en el directorio de claves de APT
RUN wget -qO /usr/share/keyrings/php.gpg https://packages.sury.org/php/apt.gpg

# Agregar el repositorio de PHP 8.2 usando la clave GPG importada
RUN echo "deb [signed-by=/usr/share/keyrings/php.gpg] https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php.list

# Actualizar e instalar PHP-FPM 8.2 y el paquete php8.2-mysql (mysqli)
RUN apt -y update && apt -y install php8.2-fpm php8.2-mysql

# Crear el directorio /run/php/ y establecer los permisos correctos
RUN mkdir -p /run/php/ && chown -R www-data:www-data /run/php/

# Instalar curl
RUN apt -y install curl

# Copiamos el default de wordpress
COPY www.conf /etc/php/8.2/fpm/pool.d/.

# Copiamos el script para instalar wordpress
COPY script.sh /usr/local/bin/script.sh

RUN chmod +x /usr/local/bin/script.sh

# Ejecutar PHP-FPM en modo foreground
CMD ["php-fpm8.2", "-F"]

CMD ["/usr/local/bin/script.sh"]

