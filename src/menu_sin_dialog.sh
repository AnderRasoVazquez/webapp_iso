##Instalación y Mantenimiento de una Aplicación Web
#Importar funciones de otros ficheros

function instalarApache() # función 1
# Comunicar si el paquete correspondiente ya está instalado y sino instalarlo.
{
    estado=`sudo aptitude show apache2 | grep "Estado:"`
    echo $estado | grep "no"
    if [ $? = 0 ]
    then
        echo "instalando..."
        sudo apt-get install apache2
    else
        echo -e "Apache ya estaba instalado\n"
    fi
}
#. ./instalarapache.sh

function configurarApache() # función 2
# 2.1 Asignar vuestro correo electrónico, como correo del adminastrador del
# servicio web, para que en caso de cualquier incidencia se le escribir un
# correo a esa dirección.
# 2.2 Las páginas web estarán en /var/www/. Por defecto, se encuentran en
# /var/www/html.
# 2.3 El servidor se encuentra por defecto escuchando las peticiones por el
# puerto 80, se cambiará para que escuche por el puerto 8080.
{
    echo -e "sin implementar\n"
}

function probarApache() # función 3
# 3.1 Poner en marcha el servicio web.
# 3.2 Testear si el servicio apache2 está en marchar con el comando
# "netstat -l" (buscar el servicio www).
# 3.3 Visualizar mediante el navegador en la dirección index.html que aparezca
# el mensaje: “It works”.
{
    echo -e "sin implementar\n"
}

function instalarModuloPHP() # función 4
# Instalar todos los paquetes php.
{
    echo -e "sin implementar\n"
}

function configurarModuloPHP() # función 5
# Instalar el paquete de PHPX que permite trabajar con MySQL.
{
    echo -e "sin implementar\n"
}

function probarModuloPHP() # función 6
# 6.1 Crear el fichero “test.php” en /var/www/ con el siguiente código:
# ( <?php phpinfo(); ?>)
# 6.2 Abrir test.php con un navegador web. ¿Qué permisos son necesarios para
# que podamos verlo todo el mundo?
{
    echo -e "sin implementar\n"
}

function instalarModuloMysql() # función 7
# Instalar el paquete Mysql de servidor y cliente.
{
    echo -e "sin implementar\n"
}

function configurarModuloMysql() # función 8
# Al usuario administrador de Mysql (“root”) asignarle la contraseña “euiti”.
{
    echo -e "sin implementar\n"
}

function probarModuloMysql() # función 9
# Testear el servicio mysql "netstat -l" y ponerlo en marcha en caso de estar
# detenido.
{
    echo -e "sin implementar\n"
}

function instalarAplicacion() # función 10
# Ejecutar el fichero “web.sql” para crear las tablas y la base datos.
# Copiar el fichero “consultaprofesores.php” en /var/www/, asignar permisos
# y comprobar que aparece la información de los profesores en la dirección
# consultaprofesores.php.
{
    echo -e "sin implementar\n"
}

function backupAplicacion() # función 11
# Crear el fichero comprimido web.tar.gz con los ficheros de “/var/www/”
# y los datos de la base de datos “web”.
{
    echo -e "sin implementar\n"
}

function restaurarAplicacion() #función 12
# Restaurar la base de datos y los ficheros de “/var/www/” desde el fichero
# web.tar.gz. Aviso: para el backup y restauración de la base de datos,
# utilizar mysqldump.
{
    echo -e "sin implementar\n"
}

function salir() # función 13
# Aperece un mensaje de despedida y los nombres de los miembros del grupo.
{
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

function mostrarOpciones() {
    #Mostrar menu
    echo
    echo -e "0) Mostar menu"
    echo -e "1) Instalación de Apache"
    echo -e "2) Configurar el servicio web Apache"
    echo -e "3) Probar/testear el servicio web Apache"
    echo -e "4) Instalar el módulo PHP"
    echo -e "5) Configurar el módulo PHP"
    echo -e "6) Probar/testear el módulo PHP"
    echo -e "7) Instalar el módulo Mysql"
    echo -e "8) Configurar el módulo Mysql"
    echo -e "9) Probar/testear el módulo Mysql"
    echo -e "10) Instalar la aplicación"
    echo -e "11) Hacer un backup de la aplicación"
    echo -e "12) Restaurar la aplicación"
    echo -e "13) Salir\n"
}

### Comienzo del programa ###
opcionMenuPpal=0
mostrarOpciones
while test $opcionMenuPpal -ne 13
do
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
