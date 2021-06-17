#!/bin/bash

# Esta función de es para comprobar si se es root. Si no lo es
# da un mensaje y sale del script, ya que no tiene sentido continuar.

function f_comprobar_root {
    if [[ $(whoami) == 'root' ]]
    then
        return 0
    else
        echo "Necesitas ser root"
        exit 1
    fi 
}

## Comprobar las variables 

## Esta cumprueba si el número de parámetros ingresados es menor o
## mayor de 3 y sale si no se cumple con ello.

function f_numparam {
    if [[ $# -ne 3 ]] 
    then
        echo "Número de parámetros incorrectos."
        echo "Necesitas un dispositivo, un sistema de archivos y un punto de montaje."
        exit 1
    else
        return 0
    fi
}

## Esta comprueba si el dispositivo existe y te muestra
## los dispositivos que hay.

function f_comprobar_p1 {
    if [[ -n $(blkid | grep $1.*) ]]
    then
        return 0
    else
        echo "No existe el disposito, ingresa uno válido."
        lsblk
        exit 1
    fi
}

## Esta comprueba si el sistema de ficheros está instalado.
## Si no lo está y está comprendido entre las opciones, lo instala.

function f_comprobar_p2 {
    if [[ -n $(which mkfs.$1) ]]
    then
        return 0
    else
        echo "No existe ese sistema de archivos."
        if [[ $1 == 'exfat' ]]
        then
            read -p "¿Quieres instalarlo? (s/n)" l
            case $l in
                [Ss])
                apt-get install exfat-utils -y &> /dev/null
                echo "Instalado, ya puede volver a iniciar el script."
                exit 1
                ;;
                [Nn])
                exit 1
                ;;
            esac
        elif [[ $1 == 'ntfs' ]]
        then
            read -p "¿Quieres instalarlo? (s/n)" l
            case $l in
                [Ss])
                apt-get install ntfs-3g -y &> /dev/null
                echo "Instalado, ya puede volver a iniciar el script."
                exit 1
                ;;
                [Nn])
                exit 1
                ;;
            esac
        elif [[ $1 == 'xfs' ]]
        then
            read -p "¿Quieres instalarlo? (s/n)" l
            case $l in
                [Ss])
                apt-get install xfsprogs -y &> /dev/null
                echo "Instalado, ya puede volver a iniciar el script."
                exit 1
                ;;
                [Nn])
                exit 1
                ;;
            esac
        else
            echo "Saliendo del script."
            exit 1
        fi
    fi
}

## Por último, en esta rama, comprueba si el punto de montaje
## existe.

function f_comprobar_p3 {
    if [[ -d $1 ]]
    then
        return 0
    else
        echo "No existe ese punto de montaje."
        exit 1
    fi
}


# Esta función crea la partición y da el sistema de archivos
# en modo simple


function f_disk_format {
    gdisk /dev/$1 << EOF
n



8300
w
y
EOF

mkfs.$2 -F /dev/$11
}

## Añade los parámetros al /etc/fstab y monta todo lo que hay.

function f_fstab {
    uuid=0
    uuid=`blkid | grep $1.* | awk '{print $2}'`
    echo $uuid $3 $2 'defaults 1 1' >> /etc/fstab
    #sed -i '$a UUID='$uuid $3 $2' defaults 1 1' /etc/fstab
    mount -a
}

## Da la posibilidad de reiniciar la máquina si quieres.

function f_reinicio {
    read -p "¿Quieres reiniciar la máquina? (s/n) " t
    case $t in
        [Ss])
        reboot
        ;;
        [Nn])
        exit 1
        ;;
    esac
}