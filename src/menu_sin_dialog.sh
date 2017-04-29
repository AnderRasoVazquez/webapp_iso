##Instalación y Mantenimiento de una Aplicación Web
#Importar funciones de otros ficheros

. ./funciones/utilidades/colores.sh
. ./funciones/menu_sin_dialog/apache/instalarApache.sh
. ./funciones/menu_sin_dialog/apache/configurarApache.sh
. ./funciones/menu_sin_dialog/apache/probarApache.sh


instalarModuloPHP() { # función 4
# Instalar todos los paquetes php.
    echo -e "sin implementar\n"
}

configurarModuloPHP() { # función 5
# Instalar el paquete de PHPX que permite trabajar con MySQL.
    echo -e "sin implementar\n"
}

probarModuloPHP() { # función 6
# 6.1 Crear el fichero “test.php” en /var/www/ con el siguiente código:
# ( <?php phpinfo(); ?>)
# 6.2 Abrir test.php con un navegador web. ¿Qué permisos son necesarios para
# que podamos verlo todo el mundo?
    echo -e "sin implementar\n"
}

instalarModuloMysql() { # función 7
# Instalar el paquete Mysql de servidor y cliente.
    echo -e "sin implementar\n"
}

configurarModuloMysql() { # función 8
# Al usuario administrador de Mysql (“root”) asignarle la contraseña “euiti”.
    echo -e "sin implementar\n"
}

probarModuloMysql() { # función 9
# Testear el servicio mysql "netstat -l" y ponerlo en marcha en caso de estar
# detenido.
    echo -e "sin implementar\n"
}

instalarAplicacion() { # función 10
# Ejecutar el fichero “web.sql” para crear las tablas y la base datos.
# Copiar el fichero “consultaprofesores.php” en /var/www/, asignar permisos
# y comprobar que aparece la información de los profesores en la dirección
# consultaprofesores.php.
    echo -e "sin implementar\n"
}

backupAplicacion() { # función 11
# Crear el fichero comprimido web.tar.gz con los ficheros de “/var/www/”
# y los datos de la base de datos “web”.
    echo -e "sin implementar\n"
}

restaurarAplicacion() { #función 12
# Restaurar la base de datos y los ficheros de “/var/www/” desde el fichero
# web.tar.gz. Aviso: para el backup y restauración de la base de datos,
# utilizar mysqldump.
    echo -e "sin implementar\n"
}

salir() { # función 13
# Aperece un mensaje de despedida y los nombres de los miembros del grupo.
    read -p "¿Quieres salir del programa?(S/n) " respuesta
    if [ $respuesta != "S" ]
    then
        echo
        opcionMenuPpal=0
    else
        echo "Programa terminado" #Fin del programa
        echo "Programa por:"
        echo "Guillermo apellido1 apellido2"
        echo "David Pérez Gómez"
        echo "Ander Raso Vázquez"
    fi


}

# Muestra una opción formateada con colores
mostrarOpcion() {
    printPurple "${1} "
    printf "${2}\n"
}

mostrarOpciones() {
    #Mostrar menu
    mostrarOpcion "0)" "Mostar menu"
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

### Comienzo del programa ###
opcionMenuPpal=0
while test $opcionMenuPpal -ne 13
do
    echo
    mostrarOpciones
    echo
    read -p "Introduce una opción: " opcionMenuPpal
    #Realizar acción especifica en base a la elección del usuario
    case $opcionMenuPpal in
        0) mostrarOpciones;;
        1) instalarApache;;
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
        13) salir;;
        *) ;;

    esac #Fin selección de acción especifica del usuario
done #Fin del bucle ppal
exit 0 #Fin del programa
