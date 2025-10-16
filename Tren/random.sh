#!/bin/bash

################### 23/09/25 ####################
# Script que instala sigilosamente lolcat, sl y #
# figlet, además mostrará un tren de colores al #
# final y un rotulo de 2ASIR                    #
################# Esteban Ruiz ##################
#################  Script v2   ##################

usuario=`whoami`

# If para instalar requerimientos
if [ "$usuario" == "root" ] # Test de que eres root
then # Instala SI eres root de manera sigilosa
	apt install -y mpg123 > /dev/null 2>&1
	if [ &? -ne 0 ] # IF para anotar errores de instalación en logs (&? = Ultimo error)
	then
		if [ -f tren.log ]  # Verificar si fichero de logs existe y si no lo crea
		then
			echo "[X] Atención! Fallo en la instalación de mpg123" >> tren.log
		else
			echo "[X] Atención! Fallo en la instalación de mpg123" > tren.log
		fi
		echo "[V] mpg123 Instalado correctamente!"
	fi
	apt install -y sl > /dev/null 2>&1
	if [ &? -ne 0 ] # Comprobación de errores y log
	then
		echo "[X] Atención! Fallo en la instalación de mpg123" >> tren.log
	else
		echo "[V] sl Instalado correctamente"
	fi
	apt install -y lolcat > /dev/null 2>&1
	if [ &? -ne 0 ] # Comprobación de errores y log
	then
		echo "[X] Atención! Fallo en la instalación de lolcat" >> tren.log
	else
		echo "[V] lolcat Instalado correctamente"
	fi
	apt install -y figlet > /dev/null 2>&1
	if [ &? -ne 0 ] # Comprobación de errores y log
	then
		echo "[X] Atención! Fallo en la instalación de figlet" >> tren.log
	else
		echo "[V] figlet Instalado correctamente"
	fi
else # Si no eres root aborta con error 1
	echo "Tienes que ser root!"
	exit 1
fi
mpg123 tren.mp3 > /dev/null 2>&1 & figlet "Listo!"
