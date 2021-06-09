#!/bin/bash

# $2 será equivalente a la ruta de la lista

case $1 in
    [Mm]ake)
    echo "Creando directorios ..."
    i=0
    while read line
    do 
        if [ -d $line ]
        then
            echo "El directorio ya existe."
        else
            if [ ${#line[$i]} -gt 5 ]
            then
                echo "No puedo crear  el directorio $line, tiene más de 5 caractéres."
            else
                mkdir $line
            fi
        fi
    done <$2
    ;;
    *|help)
        echo "Indica make para que funcione el script"
    ;;
esac

