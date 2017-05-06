#!/bin/bash

probarMysql() {
    # Testear el servicio mysql "netstat -l" y ponerlo en marcha en caso de
    # estar detenido.

    # Variables
    MYSQL='mysql.service'

    # Testear el servicio mysql "netstat -l" y ponerlo en marcha en caso de estar
    # detenido.
    if [ "`systemctl is-active $MYSQL`" = "active" ]
    then
        printf "$MYSQL está activo\n"
    else # MySQL-server no activo
        read -p "$MYSQL no esta activo. ¿Poner en marcha? (S/n) " respuesta
        if [ $respuesta = "S" ]
        then
            # se intenta iniciar MySQL
            printf "iniciando $MYSQL...\n"
            sudo systemctl start $MYSQL
            probarMysql
        fi
    fi
}
