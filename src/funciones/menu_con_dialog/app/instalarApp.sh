#VARIABLES GLOBALES

USER='root'
PASSWORD='euiti'
PROFESORES='consultarprofesores.php'
CARPETA='/var/www/'
DIRECCION='http://localhost:8080/consultarprofesores.php'
SALIDA='/tmp/salida.txt'

instalarApp(){ #funcion 10

	dialog --backtitle "Proyecto" --title "Instalar Aplicacion" \
   	--msgbox "Instalando aplicacion...\n" 5 70

	mysql -u $USER -p$PASSWORD < web.sql &> $SALIDA
	if test $? = 0
	then
		sudo cp $PROFESORES $CARPETA
		if test $? = 0 
		then
			dialog --backtitle "Proyecto" --title "Instalar Aplicacion" \
   			--msgbox "Mostrando profesores...\n" 5 70

            		sensible-browser $DIRECCION > /dev/null 2>&1
		else
			dialog --backtitle "Proyecto" --title "Instalar Aplicacion" \
   			--msgbox "ERROR: No se ha podido mostrar profesores...\n" 5 70
		fi
	else
		dialog --backtitle "Proyecto" --title "Instalar Aplicacion" \
   		--msgbox "ERROR: No se ha podido instalar la aplicacion...\n" 5 70
	fi

	rm $SALIDA
}
