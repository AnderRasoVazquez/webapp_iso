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
    FICH_MAIL="temp/apache_mail.txt"

    crearCopiaConfiguracionApache
    cambiarPuerto
    cambiarCarpetaWebs
    cambiarEmailAdmin
    reiniciarApache
    dialog --backtitle "Proyecto" --title "Configurar Apache" \
    --msgbox "Configuración del servidor Apache finalizada.\n" 5 70
}

# crea una copia de seguridad de la configuración de apache
crearCopiaConfiguracionApache() {
    dialog --backtitle "Proyecto" --title "Configurar Apache" \
    --msgbox "Creando copia de seguridad de la configuración actual...\n" 5 70
    sudo cp $CONF_SITE $CONF_SITE_BACKUP
    sudo cp $PORTS_FILE $PORTS_FILE_BACKUP
}

# cambia el puerto por defecto
cambiarPuerto() {
    dialog --backtitle "Proyecto" --title "Configurar Apache" \
    --msgbox "Cambiando el puerto 80 por ${PORT}...\n" 5 70
    sudo sed -i "s/^Listen [0-9]*/Listen ${PORT}/" $PORTS_FILE
}

# cambia el email por defecto
cambiarEmailAdmin() {
    dialog --inputbox "Introduce el email del adiministrador:" 8 40 2> $FICH_MAIL
    email=`more $FICH_MAIL`
    rm $FICH_MAIL
    sudo sed -i "s/ServerAdmin .*/ServerAdmin ${email}/" $CONF_SITE
}

# cambia la carpeta de recursos web por defecto
cambiarCarpetaWebs() {
    dialog --backtitle "Proyecto" --title "Configurar Apache" \
    --msgbox "Cambiando '/var/www/html' por '/var/www'...\n" 5 70
    sudo sed -i "s/DocumentRoot .*/DocumentRoot ${CARPETA_RAIZ}/" $CONF_SITE
}

# reinicia apache
reiniciarApache() {
    dialog --backtitle "Proyecto" --title "Configurar Apache" \
    --msgbox "Reiniciando apache para aplicar los cambios...\n" 5 70
    sudo systemctl restart apache2.service
}
