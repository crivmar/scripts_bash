#!/bin/bash

# Esta función de es para comprobar si se es root

function f_comprobar_root {
    if [[ $(whoami) == 'root' ]]
    then
        return 0
    else
        return 1
    fi 
}

# La función detecta si eres root o no, te da la opción de activarlo
# y si no quieres te saca ya que esto debe hacerse con root.

function f_root {
    estado=$(f_comprobar_root; echo $?)
    if [[ $estado == 1 ]]
    then
        echo "No eres root."
        read -p "¿Quieres activar root? (s/n)" r
        case $r in
            [Ss])
            su -
            ;;
            [Nn])
            exit 1
            ;;
        esac
    fi
}

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
    #lsblk -f | grep $11 | awk '{print $3}'
    uuid=`blkid | grep $1.* | awk '{print $2}'`
    echo $uuid $3 $2 'defaults 1 1' >> /etc/fstab
    #sed -i '$a UUID='$uuid $3 $2' defaults 1 1' /etc/fstab
    mount -a
}

