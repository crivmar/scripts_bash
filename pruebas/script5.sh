#!/bin/bash

nom=$USER

dia=`date +%D`		#Indica el día en el que estamos, formato inglés.

dir=$PWD


if [ $dir != "/home" ]
then	
	echo "Hola $nom , no estás en '/home' y hoy es $dia"
else
	echo "Hola $nom, estás en $dir y hoy es $dia"
fi


