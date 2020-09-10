#!/bin/bash

# Nombre:	borratemp.sh
# Autor:	Charlie Martínez® <cmartinez@quirinux.org>
# Licencia:	https://www.gnu.org/licenses/gpl-3.0.txt
# Descripción:	Libera espacio en GNU/Linux
# Versión:	2.0-estable

# Limpieza final

# Configurar paquetes

sudo dpkg --configure -a

# Lmpiar cache

sudo apt-get clean && sudo apt-get autoclean

# Regenerar cache

sudo apt-get update --fix-missing

# Instalando dependencias

sudo apt-get install -f
sudo apt-get update -y
sudo apt-get autoremove --purge -y

# Realizar una limpieza final

sudo rm -rf /var/lib/apt/lists/lock/* 
sudo rm -rf /var/cache/apt/archives/lock/* 
sudo rm -rf /var/lib/dpkg/lock/*
sudo rm -rf /lib/live/mount/rootfs/*
sudo rm -rf /lib/live/mount/*
sudo rm -rf /var/cache/apt/archives/*.deb
sudo rm -rf /var/cache/apt/archives/partial/*.deb
sudo rm -rf /var/cache/apt/partial/*.deb
sudo rm -rf /opt/tmp/*
sudo rm -rf /.git

# Eliminar toda la documentación (CUIDADO!)

sudo rm -rf /usr/share/doc/*

# Vacíar la papelera de reciclaje

for usuarios in /home/*/.local/Trash/*; do sudo yes | sudo rm $usuarios; done
