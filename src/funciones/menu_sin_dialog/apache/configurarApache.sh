#!/bin/bash

# importar funciones necesarias
. ./funciones/utilidades/colores.sh

# funcion principal
configurarApache() {
    # 1. Asignar vuestro correo electrónico, como correo del adminastrador del
    # servicio web, para que en caso de cualquier incidencia se le escribir un
    # correo a esa dirección.
    # 2. Las páginas web estarán en /var/www/. Por defecto, se encuentran en
    # /var/www/html.
    # 3. El servidor se encuentra por defecto escuchando las peticiones por el
    # puerto 80, se cambiará para que escuche por el puerto 8080.

    # Variables
    CONF_SITE='/etc/apache2/sites-available/000-default.conf'
    CONF_SITE_BACKUP='/etc/apache2/sites-available/000-default.conf.backup'
    PORTS_FILE='/etc/apache2/ports.conf'
    PORTS_FILE_BACKUP='/etc/apache2/ports.conf.backup'
    PORT=8080
    CARPETA_RAIZ='\/var\/www'

    crearCopiaConfiguracionApache
    cambiarPuerto
    cambiarCarpetaWebs
    cambiarEmailAdmin
    reiniciarApache
    printExito "Configuración del servidor apache finalizada.\n"
}

# crea una copia de seguridad de la configuración de apache
crearCopiaConfiguracionApache() {
    printf "Creando copia de seguridad de la configuración actual...\n"
    sudo cp -v $CONF_SITE $CONF_SITE_BACKUP
    sudo cp -v $PORTS_FILE $PORTS_FILE_BACKUP
}

# cambia el puerto por defecto
cambiarPuerto() {
    printf "Cambiando el puerto 80 por ${PORT}...\n"
    sudo sed -i "s/^Listen [0-9]*/Listen ${PORT}/" $PORTS_FILE
    sudo sed -i "s/<VirtualHost \*:[0-9]*>/<VirtualHost *:${PORT}>/" $CONF_SITE

}

# cambia el email por defecto
cambiarEmailAdmin() {
    read -p "Introduce el email del administrador: " email
    sudo sed -i "s/ServerAdmin .*/ServerAdmin ${email}/" $CONF_SITE
}

# cambia la carpeta de recursos web por defecto
cambiarCarpetaWebs() {
    printf "Cambiando '/var/www/html' por '/var/www'...\n"
    sudo sed -i "s/DocumentRoot .*/DocumentRoot ${CARPETA_RAIZ}/" $CONF_SITE
}

# reinicia apache
reiniciarApache() {
    printf "Reiniciando apache para aplicar los cambios...\n"
    sudo systemctl restart apache2.service
}
