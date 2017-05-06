#!/bin/bash

instalarPHP() {
    # Instalar todos los paquetes php.

	estado=`aptitude show php | grep "Estado:"`
	echo $estado | grep "no"
	if test $? = 0
	then
	    echo "Installando PHP..."
	    sudo apt install php libapache2-mod-php
	else
	  echo "PHP ya estaba instalado"
	fi
}
