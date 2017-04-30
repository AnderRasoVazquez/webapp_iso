probarMysql() { # función 9
# Testear el servicio mysql "netstat -l" y ponerlo en marcha en caso de estar
# detenido.
    while [ 0 ]
    do
        sudo netstat -tap | grep mysql
        if [ $? != 0 ]
        then # MySQL-server no activo
            read -p "MySQL-server no esta activo. ¿Poner en marcha? (S/n) " respuesta
            if [ $respuesta = "S" ]
            then # respuesta = S
                # se intenta reiniciar MySQL-server y se vuelve al principio
                # del ciclo
                sudo systemctl restart mysql.service
            else # respuesta = n (!= S)
                # se ha decidido no hacer nada
                echo
                break # fin del metodo
        fi
        else # MySQL-server activo
            echo -e "MySQL-server está activo\n"
            break # fin del metodo
    fi
    done
}
