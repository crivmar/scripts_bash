#!/bin/bash

# Recorrer una lista

lista=(Alberto María Pepe Carla Antonio Alba)

for i in ${lista[@]}
do
	echo $i
done

# Recorrer una lista pero con una condición

echo "Ahora nombres que comienzan por A"

for i in ${lista[@]}
do
	if [[ $i == A* ]]	#Si i empieza por a, muéstralo
	then
		echo $i
	fi
done

# Cuenta progresiva

echo "Cuenta progresiva..."

for i in {1..5}
do
	echo $i
	sleep 1
done
