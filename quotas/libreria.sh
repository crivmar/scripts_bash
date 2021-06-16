#!/bin/bash

## Función que comprueba si eres o no.
## Si no lo eres, se acaba el script.

function f_comprobar_su {
    if [[ $(whoami) == 'root' ]]
    then
        return 0
    else
        echo "Necesitas ser root"
        return exit 1
    fi 
}

function f_paquetes_quota {
    if [[ -n $(dpkg --get-selections | grep quota) ]]
    then
        read -p "¿Quieres instalarlo? (s/n)" t
        case $t in
            [Ss)]
            apt-get install quota -y &> /dev/null
            ;;
            [Nn)]
            echo "Saliendo del script, no se puede continuar."
            exit 1
            ;;
        esac
    elif [[ -n $(dpkg --get-selections | grep quotatool) ]]
    then
        read -p "¿Quieres instalarlo? (s/n)" t
        case $t in
            [Ss)]
            apt-get install quotatool -y &> /dev/null
            ;;
            [Nn)]
            echo "Saliendo del script, no se puede continuar."
            exit 1
            ;;
        esac
    else
        return 0
    fi
}