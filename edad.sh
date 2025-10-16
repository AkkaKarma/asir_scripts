#/bin/bash

########################################
# Script que comprueba si una persona  #
# introduce su edad o no               #
########################################

edad=""

while [ -z $edad ] || [ $edad -lt "10" ] || [ $edad -gt "100" ]; do
	read -p "Introduce tu edad [entre 10 y 100 años]: " edad
done
echo "Tienes $edad"

#if [ $edad -lt "10" ] || [ $edad -gt "99" ]; then
#	echo "Edad incorrecta"
#else
#	echo "Tienes $edad"
#fi
