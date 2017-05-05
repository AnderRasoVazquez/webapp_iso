#!/bin/bash
#VARIABLES GLOBALES
CARPETA_BACKUP="/var/www"
NOMBRE_BACKUP="web.tar.gz"
ORIGEN="/var/www/"
WEB_SQL="/tmp/web_backup.sql"

backupApp() { # función 11
    cd $ORIGEN
    read -p "Introduce la contraseña de mysql: " pass
    mysqldump -u root -p$pass web > $WEB_SQL &> /dev/null
    if [ $? == 0 ]
    then
        sudo mv $WEB_SQL $ORIGEN
        sudo tar --exclude="html" -zcf "$CARPETA_BACKUP/$NOMBRE_BACKUP" *
        printf "Copia de seguridad $NOMBRE_BACKUP guardada en $CARPETA_BACKUP\n"
    else
        printf "Contraseña de mysql incorrecta.\nNo se ha realizdo la copia de reguridad.\n"
    fi
}
