MYSQL="mysql-server"

instalado() {
    #Comprueba a ver si está instalado el paquete apache2
    aux=`aptitude show $MYSQL | grep "State: installed"`
    aux2=`aptitude show $MYSQL | grep "Estado: instalado"`
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

instalarMysql() { # función 7
# Instalar el paquete Mysql de servidor y cliente.
    dialog --backtitle "Proyecto" --title "Aplicación Web" \
    --msgbox "Esta opción hará lo siguiente:\n\n\
    Comprueba si el servidor $MYSQL ya está instalado, y si no lo está, lo instala." 10 50 #Dialog para mostrar nuestros nombres
    # Llamamos a la función
    instalado $1 &> /dev/null

    # Comprobamos el resultado... si el resultado es 1 quiere decir que ya está instalado, si es 0 entonces no está instalado
    if [ "$?" = "1" ]
    then
        #Si el paquete está instalado entonces se envía el mensaje
        sleep 1
        dialog --msgbox "Ya tienes instalado el paquete $MYSQL.\n" 5 50
    else
        #Si no está instalado, lo instalamos
        dialog --msgbox "Como no está instalado, procederemos a la instalación.\n" 5 60
        sudo apt-get install $MYSQL
        sleep 1
        dialog --msgbox "$MYSQL ha sido instalado.\n" 5 40
    fi
    sleep 1
}
