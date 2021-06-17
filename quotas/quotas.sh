#!/bin/bash

. ./libreria.sh

## Lo primero es comprobar si se es superusuario.

echo "Comprobando si eres superusuario."

f_comprobar_su

## Comprobar si se tienen los paquetes instalados

echo "Comprobando instalación de paquetes."

f_paquete1

f_paquete2


read -p "Dime un punto de montaje "  m

f_directorio $m

echo $m