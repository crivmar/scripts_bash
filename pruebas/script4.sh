#!/bin/bash

num1=30
num2=50

num3=$((num1 + num2))
num4=$((num1 - num2))
num5=$((num1 * num2))
num6=$((num1 / num2))	#Dará 0, porque bash no sabe tratar con decimales

echo "La suma de $num1 y $num2 es $num3"

echo "La resta de $num1 y $num2 es $num4"

echo "La multiplicación de $num1 y $num2 es $num5"

echo "La división de $num1 y $num2 es $num6, aunque no es correcto porque daría un decimal"

# Condicional

if [[ "$num1" -ne "$num2"  ]]
then
	echo "$num1 y $num2 no son iguales"
else
	echo "$num1 y $num2 son igualess"
fi

file="/home/debian/Github/scripts_bash/"

if [ -d $file  ]	#-d significa si existe y es un directorio
then
	echo "$file existe y es un directorio"
else
	echo "$file no existe o no es un directorio"
fi

if [ -r $file  ] && [ -x $file  ]	# -r permiso de lectura / -x permiso de ejecución
then
	echo "¡OK! $file tiene permisos de lectura y de ejecución"
else
	echo "$file no tiene permisos de lectura y ejecución simultáneamente"
fi


