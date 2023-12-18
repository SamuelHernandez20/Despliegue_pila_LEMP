# Practica_LEMP

Para la realización de esta práctica hay que realizar la instalación de la pila **LEMP**, mediante un proceso similar al de la pila **LAMP**, pero esta vez instalando el servidor web **Nginx**. también se hará uso del paquete **php-fpm**, pues junto con dicho servidor permite mejorar el consumo de memoria del servidor, haciendo que el servidor tenga un bajo consumo de recursos, mejorando de esta manera su rendimiento y escalabilidad.

## Estructura de directorios:

````
.
├── README.md
├── conf
│   └── default.conf
├── php
│   ├── index.php
└── scripts
    └── Install_LEMP.sh
````

## 1. Implantación de la pila LEMP:

Procedo a Instalar el servidor web **Nginx**:

```
apt install nginx -y
```

Instalación de **php-fpm** y **php-mysql**:

```
apt install php-fpm php-mysql -y
```

Copiar el archivo de configuración de **Nginx**:

```
cp ../conf/default /etc/nginx/sites-available/default
```
Reiniciar el servicio **Nginx**:

```
systemctl restart nginx
```
Procedo a copiar el archivo php al **/var/www/html**:

```
cp ../php/info.php /var/www/html
```
Modificar el propietario y grupo de /var/www/html para usuario de **Nginx**:

```
chown -R www-data:www-data /var/www/html
```
## 2. Archivo de configuración de Nginx:
Habrá que configurarlo para poder definir los enlaces permanentes y que WordPress pueda trabajar con **enlaces permanentes**.
Yo en principio agregué en el **default** la siguiente línea:
```
location / {
# First attempt to serve request as file, then
# as directory, then fall back to displaying a 404.
index index.php index.html index.htm;
try_files $uri $uri/ /index.php?$args;
        }
```
## 3. Modificación del script del Let's Encrypt:
Será necesario modificar al servidor que quiero definir como solicitante, en este caso **nginx**
```
certbot --nginx -m $CORREO --agree-tos --no-eff-email -d $dominio --non-interactive
```

