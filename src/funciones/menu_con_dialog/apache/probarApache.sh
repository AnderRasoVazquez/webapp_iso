#!/bin/bash

# importar funciones necesarias
. ./funciones/utilidades/colores.sh

# funcion principal
probarApache() {
    # 1. Poner en marcha el servicio web.
    # 2. Testear si el servicio apache2 está en marchar con el comando
    # "netstat -l" (buscar el servicio www).
    # 3. Visualizar mediante el navegador en la dirección index.html que
    # aparezca el mensaje: “It works”.

    # Variables
    APACHE='apache2.service'
    DEFAULT_PAGE="http://localhost:8080"

    ponerEnMarchaServer
	estaApacheEnMarcha
}

# Poner en marcha el servicio web.
ponerEnMarchaServer() {
    dialog --backtitle "Proyecto" --title "Probar Apache" \
    --msgbox "Poniendo en marcha el servidor Apache...\n" 5 70
    sudo systemctl start apache2.service
}

# testea si el servicio apache2 está en marcha
estaApacheEnMarcha() {
	if test "`systemctl is-active ${APACHE}`" = "active"
	then
        dialog --backtitle "Proyecto" --title "Probar Apache" \
        --msgbox "${APACHE} está activo, abriendo navegador...\n" 5 70
		visualizarPagina $DEFAULT_PAGE
	else
        dialog --backtitle "Proyecto" --title "Probar Apache" \
        --msgbox "${APACHE} no está activo.\n" 5 70
	fi
}

# visualiza mediante el navegador adecaudo la dirección proporcionada
visualizarPagina(){
    sensible-browser $1 &> /dev/null &
	# Redirijo el output porque no quiero que salga info del navegador
	# al abrirlo en la terminal, así se verá más limpio.
}
