#!/bin/bash

probarMysql() {
    # Testear el servicio mysql "netstat -l" y ponerlo en marcha en caso de
    # estar detenido.

    # Variables
    MYSQL='mysql.service'
    SALIDA='temp/salida.txt'

    # Testear el servicio mysql "netstat -l" y ponerlo en marcha en caso de estar
    # detenido.
    if [ "`systemctl is-active $MYSQL`" = "active" ]
    then
        dialog --backtitle "Proyecto" --title "Aplicacion Web" \
        --msgbox "$MYSQL está activo\n" 5 40
    else # MySQL-server no activo
        dialog --inputbox "$MYSQL no esta activo. ¿Poner en marcha? (S/n)" 8 40 2> $SALIDA
        respuesta=`less $SALIDA`
        rm $SALIDA
        if [ $respuesta = "S" ]
        then
            # se intenta iniciar MySQL
            dialog --backtitle "Proyecto" --title "Aplicacion Web" \
            --msgbox "iniciando $MYSQL..." 5 40
            sudo systemctl start $MYSQL
            probarMysql
        fi
    fi
}
