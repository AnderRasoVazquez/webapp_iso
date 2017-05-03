instalarPHP() { #funcion4
#Instala PHP con el modulo de Apache2
	estado=`sudo aptitude show php | grep "Estado:"`
	echo $estado | grep "no"
	if test $? = 0
	then 
	    echo "Installando PHP..."
	    sudo apt install php libapache2-mod-php
	else
	  echo "PHP ya estaba instalado"
	fi 
}
#. ./instalarPHP_sin_dialogo.sh

