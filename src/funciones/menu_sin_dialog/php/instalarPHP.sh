function instalarPHP()
{
	estado=`sudo aptitude show php | grep "State:"`
	echo $estado | grep "not"
	if test $? = 0
	then 
	    echo "Installando PHP..."
	    sudo apt install php libapache2-mod-php
	else
	  echo "PHP ya estaba instalado"
	fi 
}
#. ./instalarPHP_sin_dialogo.sh

