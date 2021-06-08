#!/bin/bash


lista=[Zeus, Afrodita, Ares, Hera, Poseidón, Hades, Atenea]

echo $(lista[*]) 	# Devuelve todos los valores de la lista

echo $(#lista[*])	# Devuelve el recuento de objetos de la lista

echo $(#lista[1])	# Devielve la longitud del objeto uno, como se numeran desde 0, sería Afrodita


# Si el úlitmo comando es igual a 0 ha finalizado bien, si da un fallo (es decir, devulve un 1) hace lo otro

if [ $? -eq 0 ] 
then
	echo "El comando anterior ha finalizado OK"
else
	echo "El comando anterior ha fallado :("
fi
