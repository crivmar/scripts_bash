#!/bin/bash

nom=$USER		# Variable de entorno nombre del usuario actual.

dia=`date +%D`		#Indica el día en el que estamos, formato inglés.

dir=$PWD		# Variable entorno directorio de trabajo actual.

# Si el directorio de trabajo actual no es /home dirá una cosa y si estás en él otra.
if [ $dir != "/home" ]
then
	echo "Hola $nom , no estás en '/home' y hoy es $dia"
else
	echo "Hola $nom, estás en $dir y hoy es $dia"
fi


