#!/bin/bash

configurarMysql() {
    # Al usuario administrador de Mysql (“root”) asignarle la contraseña
    # “euiti”.

    # Variables
    TEMP_LOCAL="temp"
    PASSWORD='euiti'
    SALIDA='salida.txt'

    read -s -p "Introduce la contraseña actual de MySQL: " pass
    # Se intenta entrar a mysql con la contraseña dada y cambiarla a la nueva.
    # El output se redirige a $SALIDA para que sea más limpio y para poder
    # comprobar si se ha entrado correctamente.
    printf "\n"
    mysqladmin -u root -p$pass -b password $PASSWORD &> "$TEMP_LOCAL/$SALIDA"
    if [ -n "`cat "$TEMP_LOCAL/$SALIDA" | grep "denied"`" ]
    then # no se ha pemitido el aceso
        printWarning "La contraseña introducida no es correcta: se ha denegado el aceso y no se ha cambiado la contraseña.\n"
    else
        printf "La contraseña se ha cambiado.\n"
    fi
    rm "$TEMP_LOCAL/$SALIDA"
}
