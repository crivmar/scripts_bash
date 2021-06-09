#!/bin/bash

directorio=(/root /etc /logrotate.d /tmp /home/$USER/nuevo)

case $1 in      #Lee la entrada al ejecutar el script
    [Cc]heck)
        echo "Comprobando la(s) carpeta(s)"
        i=0     # Para inicializar el bucle while y comience por el principio de la lista
        while [ $i -lt ${#directorio[*]} ]
        do 
            if [ -d ${directorio[$i]} ]
            then
                echo "${directorio[$i]} existe."
            else
                echo "${directorio[$i]} no existe."
            fi
            ((i++))
        done
    ;;
    [Mm]ake)
        echo "Creando carpeta(s)"
        for i in ${dirs[@]}
        do
            if [ -d $i ]
            then
                echo "El directorio $i ya existe."
            else
                echo "Creando directorio $i"
                mkdir -p $i
            fi
        done
    ;;
    *)
        echo "ERROR: Debes indicar check o make"
    ;;
esac

## Tiene un error que no me crea la carpeta

