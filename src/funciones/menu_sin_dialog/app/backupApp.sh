#!/bin/bash
#VARIABLES GLOBALES

backupApp() { # función 11
    TEMP_LOCAL="temp"
    CARPETA_BACKUP="/var/www"
    NOMBRE_BACKUP="web.tar.gz"
    ORIGEN="/var/www/"
    WEB_SQL="web_backup.sql"
    
    read -s -p "Introduce la contraseña de mysql: " pass
    printf "\n"
    mysqldump -u root -p$pass web > "$TEMP_LOCAL/$WEB_SQL" 2> /dev/null
    if [ $? == 0 ]
    then
        sudo mv "$TEMP_LOCAL/$WEB_SQL" $ORIGEN
        cd $ORIGEN
        sudo tar --exclude="html" -zcf "$CARPETA_BACKUP/$NOMBRE_BACKUP" *
        sudo rm $WEB_SQL
        printf "Copia de seguridad $NOMBRE_BACKUP guardada en $CARPETA_BACKUP\n"
    else
        printf "Contraseña de mysql incorrecta.\nNo se ha realizdo la copia de reguridad.\n"
    fi
}
