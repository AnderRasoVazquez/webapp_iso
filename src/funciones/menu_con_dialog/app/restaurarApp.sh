#!/bin/bash

# funcion principal
restaurarAplicacion() {
    # Restaurar la base de datos y los ficheros de “/var/www/” desde el
    # fichero web.tar.gz. Aviso: para el backup y restauración de la base
    # de datos, utilizar mysqldump.

    # Variables
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
    mysql -u $USUARIO -p$password -D web < $SQL_BACKUP &> /dev/null
    if [ $? != 0 ]
    then # no se ha pemitido el aceso
        dialog --backtitle "Proyecto" --title "Aplicación Web" \
        --msgbox "La contraseña introducida no es correcta: se ha denegado el acceso y no se ha restaurado la base de datos." 6 70
    else
        dialog --backtitle "Proyecto" --title "Aplicación Web" \
        --msgbox "La aplicación se ha restaurado completamente." 5 50
    fi
    sudo rm $SQL_BACKUP
    cd $carpeta_actual
}
