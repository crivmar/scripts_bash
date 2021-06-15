#!/bin/bash

# Script que recibe un dispositivo de bloques, un formato de
# ficheros y un punto de montaje. Con esto se configura y luego 
# está disponible tras el reinicio

. ./libreria.sh

# Lo primero es comprobar si se está como root
# porque para hacer esta función necesitas tener privilegios de root

f_comprobar_root

## Comprobar variables

f_numparam "$1" "$2" "$3"

f_comprobar_p1 "$1"

f_comprobar_p2 "$2"

f_comprobar_p3 "$3"

## Ahora hay que crear el disco tomando las dos primeras variables

#f_disk_format "$1" "$2"

## Por último añadirlo todo al fstab y montarlo

#f_fstab "$1" "$2" "$3"
