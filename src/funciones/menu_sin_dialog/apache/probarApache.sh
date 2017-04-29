# importar funciones necesarias
. ./funciones/utilidades/colores.sh

# variables globales
APACHE='apache2.service'
DEFAULT_PAGE="http://localhost:8080"

# funcion principal
probarApache() { # función 3
    ponerEnMarchaServer
	estaApacheEnMarcha
}

# Poner en marcha el servicio web. 
ponerEnMarchaServer() {
    printf "Poniendo en marcha el servidor Apache...\n"
    sudo systemctl start apache2.service
}

# testea si el servicio apache2 está en marcha
estaApacheEnMarcha() {
	if test "`systemctl is-active ${APACHE}`" = "active"
	then 
		printExito "${APACHE} está activo, abriendo navegador...\n"
		visualizarPagina $DEFAULT_PAGE
	else
		printWarning "${APACHE} no está activo.\n"
	fi 
}

# visualiza mediante el navegador adecaudo la dirección proporcionada
visualizarPagina(){
	sensible-browser $1 > /dev/null 2>&1
	# Redirijo el output porque no quiero que salga info del navegador
	# al abrirlo en la terminal, así se verá más limpio.
}
