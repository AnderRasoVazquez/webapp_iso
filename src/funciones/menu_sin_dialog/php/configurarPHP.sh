#!/bin/bash

configurarPHP() {
    # Instalar el paquete de PHPX que permite trabajar con MySQL.

	estado=`aptitude show php-mysql | grep "Estado:"`
	echo $estado | grep "no"
	if test $? = 0
	then
	    echo "Configurando PHP con MySQL ..."
	    sudo apt install php-mysql
	else
	  echo "PHP ya estaba configurado"
	fi
}
