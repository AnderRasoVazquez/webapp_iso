#!/bin/bash
CARPETA_WEB_SERVER="/var/www"
BACKUP_A_RESTAURAR="web.tar.gz"
SQL_BACKUP="web_backup.sql"
USUARIO="root"

# funcion principal
restaurarAplicacion() {
    cd $CARPETA_WEB_SERVER
    sudo tar xf $BACKUP_A_RESTAURAR
    read -s -p "Introduce la contraseña de MYSQL para root: " password
    mysql -u $USUARIO -p$password < $SQL_BACKUP 2> /dev/null
    printf "\n"
}
