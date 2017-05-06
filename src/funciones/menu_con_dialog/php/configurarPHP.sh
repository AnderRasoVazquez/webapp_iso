#!/bin/bash

configurarPHP() {
    # Instalar el paquete de PHPX que permite trabajar con MySQL.

    # Variables
    PHP_MySQL='php-mysql'

    # Configura PHP para ser compatible con MySQL
    dialog --backtitle "Proyecto" --title "Aplicación Web" \
    --msgbox "Esta opción hará lo siguiente:\n\n\
    Comprueba si PHP está configurado con MySQL, y si no lo está, lo configura." 10 50 #Dialog para mostrar nuestros nombres
    # Llamamos a la función
    instalado $1 &> /dev/null

    # Comprobamos el resultado... si el resultado es 1 quiere decir que ya está instalado, si es 0 entonces no está instalado
    if [ "$?" = "1" ]
    then
        #Si el paquete está instalado entonces se envía el mensaje
        sleep 1
        dialog --msgbox "Ya tienes instalado el paquete $PHP_MySQL.\n" 5 50
    else
        #Si no está instalado, lo instalamos
        dialog --msgbox "Como no está configurado, procederemos a la configuración.\n" 5 60
        sudo apt-get install $PHP_MySQL
        sleep 1
        dialog --msgbox "$PHP_MySQL ha sido instalado.\n" 5 40
    fi
    sleep 1
}

instalado() {
    #Comprueba a ver si PHP ya esta configurado con MySQL
    aux=`aptitude show $PHP_MySQL | grep "State: installed"`
    aux2=`aptitude show $PHP_MySQL | grep "Estado: instalado"`
    aux3=$aux$aux2
    if [ -z "$aux3" ]
    then
        # no configurado
        return 0
    else
        # configurado
        return 1
    fi
}
