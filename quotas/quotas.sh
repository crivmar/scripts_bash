#!/bin/bash

. ./libreria.sh

## Lo primero es comprobar si se es superusuario.

echo "Comprobando si eres superusuario."

f_comprobar_su

## Comprobar si se tienen los paquetes instalados

echo "Comprobando instalación de paquetes."

f_paquete1

f_paquete2

## Lo siguiente es preguntar por un punto de montaje y 
## un dispositivo, el punto de montaje se puede crear

read -p "Dime un dispositivo" d

f_disk $d

read -p "Dime un punto de montaje "  m

f_directorio $m

