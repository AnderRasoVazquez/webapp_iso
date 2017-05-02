# variables globales
PHP='php libapache2-mod-php'

instalado() {
    #Comprueba a ver si PHP ya esta instalado
    aux=`aptitude show $PHP | grep "State: installed"`
    aux2=`aptitude show $PHP | grep "Estado: instalado"`
    aux3=$aux$aux2
    if [ -z "$aux3" ]
    then
        # no instalado
        return 0
    else
        # instalado
        return 1
    fi
}

instalarPHP() { # función 4
# Instalar PHP y el paquete para apache2
    dialog --backtitle "Proyecto" --title "Aplicación Web" \
    --msgbox "Esta opción hará lo siguiente:\n\n\
    Comprueba si el servidor $PHP ya está instalado, y si no lo está, lo instala." 10 50 #Dialog para mostrar nuestros nombres
    # Llamamos a la función
    instalado $1 &> /dev/null

    # Comprobamos el resultado... si el resultado es 1 quiere decir que ya está instalado, si es 0 entonces no está instalado
    if [ "$?" = "1" ]
    then
        #Si el paquete está instalado entonces se envía el mensaje
        sleep 1
        dialog --msgbox "Ya tienes instalado el paquete $PHP.\n" 5 50
    else
        #Si no está instalado, lo instalamos
        dialog --msgbox "Como no está instalado, procederemos a la instalación.\n" 5 60
        sudo apt-get install $PHP
        sleep 1
        dialog --msgbox "$PHP ha sido instalado.\n" 5 40
    fi
    sleep 1
}
