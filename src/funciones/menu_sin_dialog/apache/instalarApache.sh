instalarApache() { # función 1
# Comunicar si el paquete correspondiente ya está instalado y sino instalarlo.
    estado=`aptitude show apache2 | grep "Estado:"`
    echo $estado | grep "no"
    if [ $? = 0 ]
    then
        printf "instalando..."
        sudo apt-get install apache2
    else
        printf "Apache ya estaba instalado\n"
    fi
}
