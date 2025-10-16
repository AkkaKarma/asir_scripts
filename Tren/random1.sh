#!/bin/bash

################### 23/09/25 ####################
# Script que instala sigilosamente lolcat, sl y #
# figlet, además mostrará un tren de colores al #
# final y un rotulo de 2ASIR                    #
################# Esteban Ruiz ##################

usuario=`whoami`

# If para instalar requerimientos
if [ "$usuario" == "root" ] # Test de que eres root
then # Instala SI eres root de manera sigilosa
   apt install -y figlet lolcat sl mpg123 > /dev/null 2>&1
else # Si no eres root aborta con error 1
   echo "Tienes que ser root!"
   exit 1
fi

mpg123 tren.mp3 > /dev/null 2>&1 & figlet "Listo!"
