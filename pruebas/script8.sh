#!/bin/bash

i=5

echo "Cuenta atrás..."

while (( i >=1 ))
do
	echo $i
	sleep 1		# Espera un segundo antes de continuar
	((i--))		# Decrementa en uno la variable i.
done
