#!/bin/bash

instalarPHP() {
    # Instalar todos los paquetes php.

    # Variables
    PHP='php libapache2-mod-php'

    # Instalar PHP y el paquete para apache2
    dialog --backtitle "Proyecto" --title "Aplicación Web" \
    --msgbox "Esta opción hará lo siguiente:\n\n\
    Comprueba si el servidor $PHP ya está instalado, y si no lo está, lo instala." 10 50 #Dialog para mostrar nuestros nombres
    estado=`aptitude show $PHP | grep "Estado:"`
    echo $estado | grep "no"
    if [ $? != 0 ]
    then
        # Si el paquete está instalado entonces se envía el mensaje
        sleep 1
        dialog --msgbox "Ya tienes instalado el paquete $PHP.\n" 5 60
    else
        # Si no está instalado, lo instalamos
        dialog --msgbox "Como no está instalado, procederemos a la instalación.\n" 5 60
        sudo apt-get install $PHP
        sleep 1
        dialog --msgbox "$PHP ha sido instalado.\n" 5 60
    fi
    sleep 1
}
