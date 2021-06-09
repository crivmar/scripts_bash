#!/bin/bash

case $1 in
	[Ss]tart)	#Contempla que empiece en mayúscula o minúsculas
	echo "Iniciando el programa"
	;;
	[Ss]top)
	echo "Parando el programa"
	;;
	help|*)
	echo "Para usar el script usa stop | start"
	;;
esac


