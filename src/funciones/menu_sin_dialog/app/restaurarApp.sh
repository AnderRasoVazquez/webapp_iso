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
    mysql -u $USUARIO -p$password < $SQL_BACKUP 2> /dev/null
    printf "\n"
    sudo rm $SQL_BACKUP
    cd $carpeta_actual
}
