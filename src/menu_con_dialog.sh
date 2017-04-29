#Importar funciones de otros ficheros
. ./funciones/menu_con_dialog/apache/apacheInstalar.sh
. ./funciones/menu_con_dialog/apache/configurarApache.sh
# . ./funciones/menu_con_dialog/apache/probarApache.sh
. ./funciones/menu_con_dialog/terminar.sh

#Definición de constantes
FICH_OPC_MENU="temp/opcion.txt"

# funcion principal
main() {
    instalacionDialog
    mostrarMenu
    mostrarAutores
    exit 0
}

# comprueba si está instalado el programa dialog
# si no lo está, pregunta si se desea instalar
instalacionDialog() { # función 1
# Comunicar si el paquete correspondiente ya está instalado y sino instalarlo.
    estado=`aptitude show dialog | grep "Estado:"`
    echo $estado | grep "no"
    if [ $? = 0 ]
    then
        read -p "Es necesario el programa 'dialog' pero no está instalado, ¿quieres instalarlo?(S/n) " respuesta
            if [ $respuesta != "S" ]
            then
                printf "Instalando dialog..."
                sudo apt-get install dialog
            else
                printf "Se necesita el programa dialog para ejecutar este programa."
                exit 1
            fi
    fi
}

# muestra el menu principal
mostrarMenu() {
    opcionMenuPpal=0

    while test $opcionMenuPpal -ne 13
    do
        #Mostrar Menú
        dialog --backtitle "Proyecto SO" --title "Aplicación Web" \
                --menu "\nElige una opción:" 20 70 13 \
                1 "Instalación de Apache"\
                2 "Configurar el servicio web Apache"\
                3 "Probar/testear el servicio web Apache"\
                4 "Instalar el módulo PHP"\
                5 "Configurar el módulo PHP"\
                6 "Probar/testear el módulo PHP"\
                7 "Instalar el módulo Mysql"\
                8 "Configurar el módulo Mysql"\
                9 "Probar/testear el módulo Mysql"\
                10 "Instalar la aplicación"\
                11 "Hacer un backup de la aplicación"\
                12 "Restaurar la aplicación"\
                13 "Salir"\
                2> $FICH_OPC_MENU

        if test $? -eq 0
        then
            #Obtener la opción del menú seleccionada por el usuario
            opcionMenuPpal=`more $FICH_OPC_MENU`

            #Borrar el fichero temporal que contiene la respuesta del usuario
            rm $FICH_OPC_MENU

            #Seleccionar la acción que quiere realizar el usuario
            case $opcionMenuPpal in
                1) apacheInstalar;;
                2) configurarApache;;
                3) probarApache;;
                4) instalarModuloPHP;;
                5) configurarModuloPHP;;
                6) probarModuloPHP;;
                7) instalarModuloMysql;;
                8) configurarModuloMysql;;
                9) probarModuloMysql;;
                10) instalarAplicacion;;
                11) backupAplicacion;;
                12) restaurarAplicacion;;
                13) terminar;;
                *) ;;
            esac #Fin de la selección del usuario
        else
            opcionMenuPpal=2
        fi

    done #Fin del bucle principal
}

# muestra los autores del proyecto
mostrarAutores() {
    dialog --backtitle "Proyecto" --title "Aplicación Web" \
    --msgbox "Autores:\n\nGuillermo Enrique Herrera Melara\nDavid Pérez Gómez\nAnder Raso Vázquez" 10 50
}


# Ejecutar el programa principal
main

