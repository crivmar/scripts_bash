#!/bin/bash

# Esta función de es para comprobar si se es root

function f_comprobar_root {
    if [[ $(whoami) == 'root' ]]
    then
        return 0
    else
        return 1
    fi 
}

function f_root {
    estado=$(f_comprobar_root; echo $?)
    if [[ $estado == 1 ]]
    then
        echo "No eres root."
        read -p "¿Quieres activar root? (s/n)" r
        case $r in
            [Ss])
            su -
            ;;
            [Nn])
            exit 1
            ;;
        esac
    fi
}