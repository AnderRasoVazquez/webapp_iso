#!/bin/bash

# funcion principal
restaurarAplicacion() {
    CARPETA_WEB_SERVER="/var/www"
    BACKUP_A_RESTAURAR="web.tar.gz"
    SQL_BACKUP="web_backup.sql"
    USUARIO="root"
	TEMP_LOCAL="temp"
    SALIDA='salida.txt'

    carpeta_actual=$PWD
    dialog --insecure --passwordbox "Introduce la contraseña actual de MySQL:" 8 40 2> "$TEMP_LOCAL/$SALIDA"
    password=`less "$TEMP_LOCAL/$SALIDA"`
    rm "$TEMP_LOCAL/$SALIDA"

    cd $CARPETA_WEB_SERVER
    sudo tar xf $BACKUP_A_RESTAURAR
    mysql -u $USUARIO -p$password < $SQL_BACKUP 2> /dev/null
    printf "\n"
    sudo rm $SQL_BACKUP
    cd $carpeta_actual
}
