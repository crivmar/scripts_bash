#!/bin/bash

## Función que comprueba si eres o no.
## Si no lo eres, se acaba el script.

function f_comprobar_su {
    if [[ $(whoami) == 'root' ]]
    then
        return 0
    else
        echo "Necesitas ser superusuario."
        exit 1
    fi 
}

## Comprobar los paquetes para ver si están instalados o no, en caso
## contrario, los instala.

function f_paquete1 {
    apt update &> /dev/null
    if [[ -z $(dpkg --get-selections | grep quota) ]]
    then
        read -p "No está instalado quota ¿Quieres instalarlo? (s/n)" t
        case $t in
            [Ss])
            apt-get install quota -y &> /dev/null
            echo "Instalado."
            ;;
            [Nn])
            echo "Saliendo del script, no se puede continuar."
            exit 1
            ;;
        esac
    fi
}

function f_paquete2 {
    apt update &> /dev/null
    if [[ -z $(dpkg --get-selections | grep quotatool) ]]
    then
        read -p "No está instalado quotatool ¿Quieres instalarlo? (s/n)" t
        case $t in
            [Ss])
            apt-get install quotatool -y &> /dev/null
            echo "Instalado."
            ;;
            [Nn])
            echo "Saliendo del script, no se puede continuar."
            exit 1
            ;;
        esac
    else
        return 0
    fi
}

funtion f_disk {
    lsblk
    if [[ -n $(blkid | grep $d.*) ]]
    then
        UUID= `blkid | grep $d.* | awk '{print $2}'`
    else
        echo "No existe el disposito, ingresa uno válido."
        exit 1
    fi
}

function f_directorio {
    if [[ -d $m ]]
    then
        echo "Punto de montaje correcto."
    else
        read -p "No existe. ¿Quieres crearlo? (s/n)" j
        case $j in
            [Ss])
            mkdir -p $m
            echo "Creado."
            ;;
            [Nn])
            echo "Hace falta un directorio, no puedo continuar."
            exit 1
            ;;
        esac
    fi
}

function f_montar {
    if [[ -n $(df -h | grep $d | awk {'print $1'}) ]]
    then
        mount $d $m
        echo "Montando dispositivo."
    else
        echo "Ya está montado."
    fi
}



function f_configurarq {
    read -p "¿l "
}