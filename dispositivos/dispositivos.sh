#!/bin/bash

# Script que recibe un dispositivo de bloques, un formato de
# ficheros y un punto de montaje. Con esto se configura y luego 
# está disponible tras el reinicio

. ./libreria.sh

# Lo primero es comprobar si se está como root
# porque para hacer esta función necesitas ser root

f_comprobar_root