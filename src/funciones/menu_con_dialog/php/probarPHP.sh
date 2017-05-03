#variables globales
CARPETA='/var/www/'
FICHERO_PHP='test.php'
PHP_PAGE='http://localhost:8080/test.php'

probarPHP() { #funcion 6
#Crear el fichero “test.php” con el siguiente código: ( <?php phpinfo(); ?>)
#Abrir test.php con un navegador web

	sudo cp $FICHERO_PHP $CARPETA
	if test $? = 0
	then
		 dialog --backtitle "Proyecto" --title "Probar PHP" \
   		--msgbox "Probando PHP...\n" 5 70

        sensible-browser $PHP_PAGE > /dev/null 2>&1

		dialog --backtitle "Proyecto" --title "Probar PHP" \
   		--msgbox "PHP funciona correctamente!\n" 5 70
	else
		 dialog --backtitle "Proyecto" --title "Probar PHP" \
   		 --msgbox "Ha ocurrido un error y PHP no se ha podido probar\n" 5 70
	fi
} 
