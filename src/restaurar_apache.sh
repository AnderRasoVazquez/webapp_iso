#!/bin/bash
# Este script sirve para devolver al estado original a apache

CONF_SITE='/etc/apache2/sites-available/000-default.conf'
CARPETA_RAIZ='\/var\/www\/html'
PORTS_FILE='/etc/apache2/ports.conf'
PORT=80
EMAIL='webmaster@localhost'

main() {
    restaurarConfiguracion
    reiniciarApache
}

restaurarConfiguracion(){
    sudo sed -i "s/^Listen [0-9]*/Listen ${PORT}/" $PORTS_FILE
    sudo sed -i "s/ServerAdmin .*/ServerAdmin ${EMAIL}/" $CONF_SITE
    sudo sed -i "s/DocumentRoot .*/DocumentRoot ${CARPETA_RAIZ}/" $CONF_SITE
    sudo sed -i 's/<VirtualHost \*:[0-9]*>/<VirtualHost *:80>/' $CONF_SITE
    sudo rm /var/www/index.html
}

reiniciarApache(){
    sudo systemctl restart apache2.service
}

main
