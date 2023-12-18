#!/bin/bash

# Actualizamos los repos

apt update

# Actualizar paquetes 

#apt upgrade

#Instalar el servidor web Nginx:

apt install nginx -y

apt install mysql-server -y

# Instalación de php-fpm y php-mysql:
#-----------------------------------------------
apt install php-fpm php-mysql -y
#-----------------------------------------------

#Copiar el archivo de conf de Nginx:

cp ../conf/default /etc/nginx/sites-available/default

#Reiniciar servicio Nginx:

systemctl restart nginx

# copiar archivo php:

cp ../php/info.php /var/www/html

# modificar el propietario y grupo de /var/www/html para usuario de Nginx:

chown -R www-data:www-data /var/www/html


