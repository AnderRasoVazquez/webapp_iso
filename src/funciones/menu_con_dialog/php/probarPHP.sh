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
		 dialog --backtitle "Proyecto" --title "Probar PHP" \
   		--msgbox "Probando PHP...\n" 5 40

        sensible-browser $PHP_PAGE > /dev/null 2>&1

		dialog --backtitle "Proyecto" --title "Probar PHP" \
   		--msgbox "PHP funciona correctamente!\n" 5 40
	else
		 dialog --backtitle "Proyecto" --title "Probar PHP" \
   		 --msgbox "Ha ocurrido un error y PHP no se ha podido probar\n" 5 60
	fi
}
