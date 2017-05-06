#!/bin/bash

instalarMysql() {
    # Instalar el paquete Mysql de servidor y cliente.
    
    estado=`aptitude show mysql-server | grep "Estado:"`
    echo $estado | grep "no"
    if [ $? = 0 ]
    then
        printf "instalando..."
        sudo apt install mysql-server
    else
        printf "MySQL-sever ya estaba instalado\n"
    fi
}
