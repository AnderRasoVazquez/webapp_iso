#!/bin/bash

probarPHP() {
    # 1. Crear el fichero “test.php” en /var/www/ con el siguiente código:
    # ( <?php phpinfo(); ?>)
    # 2. Abrir test.php con un navegador web. ¿Qué permisos son necesarios
    # para que podamos verlo todo el mundo?

    # Variables
    CARPETA='/var/www/'
    FICHERO_PHP='test.php'
    PHP_PAGE='http://localhost:8080/test.php'

	sudo cp $FICHERO_PHP $CARPETA
	if test $? = 0
	then
		echo "Probando PHP..."
	    sensible-browser $PHP_PAGE > /dev/null 2>&1
	else
		echo "Ha ocurrido un error y PHP no se ha podido probar"
	fi
}
