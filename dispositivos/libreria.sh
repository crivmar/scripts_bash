#!/bin/bash

# Esta función de es para comprobar si se es root

function f_comprobar_root {
    if [[ $(whoami) == 'root' ]]
    then
        return 0
    else
        echo "Necesitas ser root"
        return exit 1
    fi 
}

## Comprobar las variables 

function f_numparam {
    if [[ $# < 3 || $# > 3 ]]
    then
        echo "Número de parámetros incorrectos."
        exit 1
    else 
        return 0
    fi
}

function f_comprobar_p1 {
    if [[ -n $(blkid | grep $1.*) ]]
    then
        echo "Existe el dispositivo"
        return 0
    else
        echo "No existe el disposito, ingresa uno válido."
        exit 1
    fi
}

function f_comprobar_p2 {
    if [[ -n $(which mkfs.$1) ]]
    then
        echo "Existe ese sistema de archivos."
        return 0
    else
        echo "No existe ese sistema de archivos."
        exit 1
    fi
}

function f_comprobar_p3 {
    if [[ -d $1 ]]
    then
        echo "Si, existe ese punto de montaje."
        return 0
    else
        echo "No existe ese punto de montaje."
        exit 1
    fi
}


# La función detecta si eres root o no, te da la opción de activarlo
# y si no quieres te saca ya que esto debe hacerse con root.

# function f_root {
#     estado=$(f_comprobar_root; echo $?)
#     if [[ $estado == 1 ]]
#     then
#         echo "No eres root."
#         read -p "¿Quieres activar root? (s/n)" r
#         case $r in
#             [Ss])
#             su -
#             ;;
#             [Nn])
#             exit 1
#             ;;
#         esac
#     fi
# }

# Esta función crea la partición y da el sistema de archivos
# en modo simple

# function f_disk_format {
#     echo='type 83' | sfdisk /dev/$1
#     mkfs.$2 -F /dev/$11
# }

function f_disk_format {
    gdisk /dev/$1 << EOF
n



8300
w
y
EOF

mkfs.$2 -F /dev/$11
}

# function f_UUID {
#     lsblk -f | grep $11 | awk '{print $3}'
# }

function f_fstab {
    uuid=0
    uuid=`blkid | grep $1.* | awk '{print $2}'`
    echo $uuid $3 $2 'defaults 1 1' >> /etc/fstab
    #sed -i '$a UUID='$uuid $3 $2' defaults 1 1' /etc/fstab
    mount -a
}

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