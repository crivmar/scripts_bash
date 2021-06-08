#!/bin/bash

# La fecha es un valor de entrada

usuario=$(whoami)

echo "Tu nombre es $usuario"

read -p "Si deseas que te llame de otra forma escríbelo aquí o pulsa enter directamente: " nombre

if [ -z $nombre ]	#Si la cadena está vacía
then
	echo "Has decidido mantener el nombre, $usuario. Hoy es $1"
else
	echo "¡Bien!, te llamaré $nombre. Hoy es $1"
fi




