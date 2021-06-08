#!/bin/bash

echo "El script ejecutado es $0"

echo "El primer valor introducido es $1"

echo "El segundo valor introducido es $2"

echo "Recuento de valores: $*"

echo "Has indicado un total de $# argumentos"


echo "Un argumento más: "
read x

read -p "Otro más: " y

echo "Lista final de argumentos: $@ $x $y"


