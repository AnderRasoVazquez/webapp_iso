##Instalación y Mantenimiento de una Aplicación Web
#Importar funciones de otros ficheros
function instalarapache()
{
estado=`sudo aptitude show apache2 | grep "State:"`
echo $estado | grep "not"
if test $? = 0
then 
    echo "instalando ..."
    sudo apt-get install apache2
else
  echo "apache ya estaba instalado"
fi 
}
#. ./instalarapache.sh


function salirppal()
{
	echo -e "¿Quieres salir del programa?(S/N)\n"
        read respuesta
	if [ $respuesta == "N" ] 

		then
			opcionMenuPpal=0
		fi
		

}
### Comienzo del programa ###
opcionMenuPpal=0
while test $opcionMenuPpal -ne 2
do
	#Mostrar menu
	echo -e "1 Instalación de Apache \n"
	echo -e "2 Salir \n"
	read -p "Introduce una opción:" opcionMenuPpal
	#Realizar acción especifica en base a la elección del usuario
	case $opcionMenuPpal in
			1) instalarapache;;
			2) salirppal;;
			*) ;;

	esac #Fin selección de acción especifica del usuario
done #Fin del bucle ppal

echo "Programa terminado" #Fin del programa
exit 0 #Fin del programa
