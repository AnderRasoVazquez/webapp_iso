#!/bin/bash

instalarApp() {
    # Ejecutar el fichero “web.sql” para crear las tablas y la base datos.
    # Copiar el fichero “consultaprofesores.php” en /var/www/, asignar
    # permisos y comprobar que aparece la información de los profesores en la
    # dirección consultaprofesores.php.

    # Variables
    USER='root'
    PASSWORD='euiti'
    PROFESORES='consultarprofesores.php'
    CARPETA='/var/www/'
    DIRECCION='http://localhost:8080/consultarprofesores.php'
    SALIDA='temp/salida.txt'

    dialog --backtitle "Proyecto" --title "Instalar Aplicacion" \
        --msgbox "Instalando aplicacion...\n" 5 30

    mysql -u $USER -p$PASSWORD < web.sql &> $SALIDA
    if test $? = 0
    then
        sudo cp $PROFESORES $CARPETA
        if test $? = 0
        then
            dialog --backtitle "Proyecto" --title "Instalar Aplicacion" \
                --msgbox "Mostrando profesores...\n" 5 30

            sensible-browser $DIRECCION &> /dev/null &
        else
            dialog --backtitle "Proyecto" --title "Instalar Aplicacion" \
                --msgbox "ERROR: No se ha podido mostrar profesores...\n" 5 60
        fi
    else
        dialog --backtitle "Proyecto" --title "Instalar Aplicacion" \
            --msgbox "ERROR: No se ha podido instalar la aplicacion...\n" 5 60
    fi

    rm $SALIDA
}
