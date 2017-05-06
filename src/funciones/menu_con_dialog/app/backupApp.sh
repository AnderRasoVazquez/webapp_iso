#!/bin/bash

backupApp() {
    # Crear el fichero comprimido web.tar.gz con los ficheros de “/var/www/”
    # y los datos de la base de datos “web”.

    # Variables
    TEMP_LOCAL="temp"
    CARPETA_BACKUP="/var/www"
    NOMBRE_BACKUP="web.tar.gz"
    ORIGEN="/var/www/"
    WEB_SQL="web_backup.sql"
    SALIDA='salida.txt'

    path=$PWD
    dialog --backtitle "Proyecto" --title "Copia de Seguridad Aplicacion" \
    --insecure --passwordbox "Introduce la contraseña de mysql" 8 40 2> $SALIDA
    pass=`less $SALIDA`
    rm $SALIDA
    mysqldump -u root -p$pass web > "$TEMP_LOCAL/$WEB_SQL" 2> /dev/null
    if [ $? == 0 ]
    then
        sudo mv "$TEMP_LOCAL/$WEB_SQL" $ORIGEN
        cd $ORIGEN
        sudo tar --exclude={"html",$NOMBRE_BACKUP} -zcf "$CARPETA_BACKUP/$NOMBRE_BACKUP" *
        sudo rm $WEB_SQL
        dialog --backtitle "Proyecto" --title "Copia de Seguridad Aplicacion" \
       	--msgbox "Copia de seguridad $NOMBRE_BACKUP guardada en $CARPETA_BACKUP." 8 70
    else
        dialog --backtitle "Proyecto" --title "Copia de Seguridad Aplicacion" \
        --msgbox "Contraseña de mysql incorrecta.\nNo se ha realizdo la copia de reguridad." 8 70
    fi
    cd $path
}
