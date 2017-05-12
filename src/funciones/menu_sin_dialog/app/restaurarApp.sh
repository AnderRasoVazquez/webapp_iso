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

    carpeta_actual=$PWD
    cd $CARPETA_WEB_SERVER
    printf "Restaurando los siguientes archivos:\n"
    sudo tar -vxf $BACKUP_A_RESTAURAR
    read -s -p "Introduce la contraseña de MYSQL para root: " password
    mysql -u $USUARIO -p$password -D web < $SQL_BACKUP &> /dev/null
    if [ $? != 0 ]
    then # no se ha pemitido el aceso
        printWarning "\nLa contraseña introducida no es correcta: se ha denegado el acceso y no se ha restaurado la base de datos.\n"
    else
        printExito "\nLa aplicación se ha restaurado completamente.\n"
    fi
    sudo rm $SQL_BACKUP
    cd $carpeta_actual
}
