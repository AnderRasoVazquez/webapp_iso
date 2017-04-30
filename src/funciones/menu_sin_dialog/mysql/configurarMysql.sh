# variables globales
PASSWORD='euiti'
SALIDA='/tmp/salida.txt'

configurarMysql() { # función 8
# Al usuario administrador de Mysql (“root”) asignarle la contraseña “euiti”.
    read -p "Introduce la contraseña actual de MySQL: " pass
    # Se intenta entrar a mysql con la contraseña dada y cambiarla a la nueva.
    # El output se redirige a $SALIDA para que sea más limpio y para poder
    # comprobar si se ha entrado correctamente.
    mysqladmin -u root -p$pass -b password $PASSWORD &> $SALIDA
    if [ -n "`cat $SALIDA | grep "denied"`" ]
    then # no se ha pemitido el aceso
        printWarning "La contraseña introducida no es correcta: se ha denegado el aceso y no se ha cambiado la contraseña.\n"
    else
        printf "La contraseña se ha cambiado.\n"
    fi
    rm $SALIDA
}
