function instalarPHP() #funcion4
{ #Instala PHP con el modulo de Apache2
	estado=`sudo aptitude show php | grep "Estado:"`
	echo $estado | grep "no"
	if test $? = 0
	then 
	    echo "Installando PHP...\n"
	    sudo apt install php libapache2-mod-php
	else
	  echo "PHP ya estaba instalado\n"
	fi 
}
#. ./instalarPHP_sin_dialogo.sh

