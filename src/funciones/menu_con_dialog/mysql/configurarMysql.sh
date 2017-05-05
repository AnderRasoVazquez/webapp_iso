# importar funciones necesarias
. ./funciones/utilidades/colores.sh

configurarMysql() { # función 8
    TEMP_LOCAL="temp"
    PASSWORD='euiti'
    MYSQL='mysql.service'
    SALIDA='salida.txt'
# Al usuario administrador de Mysql (“root”) asignarle la contraseña “euiti”.
    dialog --insecure --passwordbox "Introduce la contraseña actual de MySQL:" 8 40 2> "$TEMP_LOCAL/$SALIDA"
    pass=`less "$TEMP_LOCAL/$SALIDA"`
    rm "$TEMP_LOCAL/$SALIDA"
    # Se intenta entrar a mysql con la contraseña dada y cambiarla a la nueva.
    # El output se redirige a $SALIDA para poder comprobar si se ha entrado
    # correctamente.
    mysqladmin -u root -p$pass -b password $PASSWORD &> "$TEMP_LOCAL/$SALIDA"
    if [ -n "`cat "$TEMP_LOCAL/$SALIDA" | grep "denied"`" ]
    then # no se ha pemitido el aceso
        dialog --backtitle "Proyecto" --title "Configurar Apache" \
        --msgbox "La contraseña introducida no es correcta: se ha denegado el aceso y no se ha cambiado la contraseña.\n" 5 70
    else
        dialog --backtitle "Proyecto" --title "Configurar Apache" \
        --msgbox "La contraseña se ha cambiado.\n" 5 70
    fi
}
