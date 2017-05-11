#!/bin/bash

##Instalación y Mantenimiento de una Aplicación Web
#Importar funciones de otros ficheros

. ./funciones/utilidades/colores.sh
. ./funciones/menu_sin_dialog/apache/instalarApache.sh
. ./funciones/menu_sin_dialog/apache/configurarApache.sh
. ./funciones/menu_sin_dialog/apache/probarApache.sh
. ./funciones/menu_sin_dialog/mysql/instalarMysql.sh
. ./funciones/menu_sin_dialog/mysql/configurarMysql.sh
. ./funciones/menu_sin_dialog/mysql/probarMysql.sh
. ./funciones/menu_sin_dialog/php/instalarPHP.sh
. ./funciones/menu_sin_dialog/php/configurarPHP.sh
. ./funciones/menu_sin_dialog/php/probarPHP.sh
. ./funciones/menu_sin_dialog/app/instalarApp.sh
. ./funciones/menu_sin_dialog/app/backupApp.sh
. ./funciones/menu_sin_dialog/app/restaurarApp.sh


salir() {
# Aperece un mensaje de despedida y los nombres de los miembros del grupo.
    read -p "¿Quieres salir del programa?(S/n) " respuesta
    if [ $respuesta != "S" ]
    then
        echo
        opcionMenuPpal=0
    else
        echo "Programa terminado" #Fin del programa
        echo "Programa por:"
        echo "Guillermo Enrique Herrera Melara"
        echo "David Pérez Gómez"
        echo "Ander Raso Vázquez"
    fi
}

# Programa principal
main() {
    mostrarMenu
    exit 0
}

# muestra el menu
mostrarMenu() {
    opcionMenuPpal=0
    while test $opcionMenuPpal -ne 13
    do
        echo
        mostrarOpciones
        echo
        read -p "Introduce una opción: " opcionMenuPpal
        #Realizar acción especifica en base a la elección del usuario
        case $opcionMenuPpal in
            1) instalarApache;;
            2) configurarApache;;
            3) probarApache;;
            4) instalarPHP;;
            5) configurarPHP;;
            6) probarPHP;;
            7) instalarMysql;;
            8) configurarMysql;;
            9) probarMysql;;
            10) instalarApp;;
            11) backupApp;;
            12) restaurarAplicacion;;
            13) salir;;
            *) ;;

        esac #Fin selección de acción especifica del usuario
    done #Fin del bucle ppal
}

mostrarOpciones() {
    #Mostrar menu
    mostrarOpcion "1)" "Instalación de Apache"
    mostrarOpcion "2)" "Configurar el servicio web Apache"
    mostrarOpcion "3)" "Probar/testear el servicio web Apache"
    mostrarOpcion "4)" "Instalar el módulo PHP"
    mostrarOpcion "5)" "Configurar el módulo PHP"
    mostrarOpcion "6)" "Probar/testear el módulo PHP"
    mostrarOpcion "7)" "Instalar el módulo Mysql"
    mostrarOpcion "8)" "Configurar el módulo Mysql"
    mostrarOpcion "9)" "Probar/testear el módulo Mysql"
    mostrarOpcion "10)" "Instalar la aplicación"
    mostrarOpcion "11)" "Hacer un backup de la aplicación"
    mostrarOpcion "12)" "Restaurar la aplicación"
    mostrarOpcion "13)" "Salir"
}

# Muestra una opción formateada con colores
mostrarOpcion() {
    printPurple "${1} "
    printf "${2}\n"
}

# ejecutar programa principal
main
