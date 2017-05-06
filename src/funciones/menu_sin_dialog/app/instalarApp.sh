#!/bin/bash

instalarApp() {
    # Ejecutar el fichero “web.sql” para crear las tablas y la base datos.
    # Copiar el fichero “consultaprofesores.php” en /var/www/, asignar
    # permisos y comprobar que aparece la información de los profesores en la
    # dirección consultaprofesores.php.

    # Variables
    USER='root'
    PASSWORD='euiti'
    PROFESORES='consultarprofesores.php'
    CARPETA='/var/www/'
    DIRECCION='http://localhost:8080/consultarprofesores.php'
    SALIDA='temp/salida.txt'

	echo 'Instalando aplicacion...'
	mysql -u $USER -p$PASSWORD < web.sql &> $SALIDA
	if test $? = 0
	then
		sudo cp $PROFESORES $CARPETA
		if test $? = 0
		then
			echo 'Mostrando profesores...'
            sensible-browser $DIRECCION > /dev/null 2>&1
		else
			echo 'ERROR: No se puede mostrar profesores'
		fi
	else
		echo 'ERROR: No se ha podido instalar la base de datos'
	fi

	rm $SALIDA
}
