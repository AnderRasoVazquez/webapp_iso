apacheInstalar() {
    dialog --backtitle "Proyecto" --title "Aplicación Web" \
    --msgbox "Esta opción hará lo siguiente:\n\n\
    Instala el servidor web Apache, comprueba si ya está instalado, y si no, lo instala." 10 50 #Dialog para mostrar nuestros nombres
    estado=`aptitude show apache2 | grep "Estado:"`
    echo $estado | grep "no"
    if [ $? = 0 ]
    then
        dialog --msgbox "Como no está instalado, procederemos a la instalación.\n" 5 60	
        sudo apt-get install apache2
        sleep 1
        dialog --msgbox "Apache ha sido instalado.\n" 5 40	
    else
        dialog --msgbox "Ya tienes instalado el paquete apache2.\n" 5 50	
    fi
}

