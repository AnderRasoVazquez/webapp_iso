#VARIABLES GLOBALES

USER='root'
PASSWORD='euiti'
PROFESORES='consultarprofesores.php'
CARPETA='/var/www/'
DIRECCION='http://localhost:8080/consultarprofesores.php'
SALIDA='/tmp/salida.txt'

instalarApp(){ #funcion 10

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
