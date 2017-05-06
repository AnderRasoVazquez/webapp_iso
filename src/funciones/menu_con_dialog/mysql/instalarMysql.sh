#!/bin/bash

instalarMysql() {
    # Instalar el paquete Mysql de servidor y cliente.

    # Variables
    MYSQL_SERVER='mysql-server'

    dialog --backtitle "Proyecto" --title "Aplicación Web" \
    --msgbox "Esta opción hará lo siguiente:\n\n\
    Comprueba si el servidor $MYSQL_SERVER ya está instalado, y si no lo está, lo instala." 10 50 #Dialog para mostrar nuestros nombres
    estado=`aptitude show $MYSQL_SERVER | grep "Estado:"`
    echo $estado | grep "no"
    if [ $? != 0 ]
    then
        #Si el paquete está instalado entonces se envía el mensaje
        sleep 1
        dialog --msgbox "Ya tienes instalado el paquete $MYSQL_SERVER.\n" 5 50
    else
        #Si no está instalado, lo instalamos
        dialog --msgbox "Como no está instalado, procederemos a la instalación.\n" 5 60
        sudo apt-get install $MYSQL_SERVER
        sleep 1
        dialog --msgbox "$MYSQL_SERVER ha sido instalado.\n" 5 40
    fi
    sleep 1
}
