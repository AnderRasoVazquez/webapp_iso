#!/bin/bash
# Este script sirve para devolver al estado original a apache

main() {
    restaurarCopias
    reiniciarApache
}

restaurarCopias(){
    sudo cp /etc/apache2/ports.conf.backup /etc/apache2/ports.conf
    sudo cp /etc/apache2/sites-available/000-default.conf.backup /etc/apache2/sites-available/000-default.conf
}

reiniciarApache(){
    sudo systemctl restart apache2.service
}

main
