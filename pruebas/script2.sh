#!/bin/bash

cadena="Tempus edax rerum"  #Esto es una variable de texto.
num=10 	#Esto es una varible numérica
comando=`ps -ef | grep bash` # Esto es una variable que obtiene un valor de un comando.

# Necesitas usar el símbolo $ para llamar a la variable

echo $cadena
echo $num
echo $comando

# Otras formas de operar numéricos 

((num++)) 	#INCREMENTO
((num+=2))	#SUMAR DOS

echo "Ahora num vale $num"
