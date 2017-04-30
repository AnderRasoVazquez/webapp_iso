function configurarPHP(){ #funcion5
#Configura PHP para poder ocuparlo con MySQL
	estado=`sudo aptitude show php-mysql | grep "Estado:"`
	echo $estado | grep "no"
	if test $? = 0
	then 
	    echo "Configurando PHP con MySQL ..."
	    sudo apt install php-mysql
	else
	  echo "PHP ya estaba configurado"
	fi 
}
#. ./configurarPHP_sin_dialogo.sh
