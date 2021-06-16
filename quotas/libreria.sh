#!/bin/bash

## Función que comprueba si eres o no root.
## Si no lo eres, se acaba el script.

function f_comprobar_root {
    if [[ $(whoami) == 'root' ]]
    then
        return 0
    else
        echo "Necesitas ser root"
        return exit 1
    fi 
}
