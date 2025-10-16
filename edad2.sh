#/bin/bash

########################################
# Script que comprueba si una persona  #
# introduce su edad o no               #
########################################

read -p "Introduce tu edad, DNI o eMail: " edad
case $edad in
	*[0-9])
		echo "Tu edad es $edad";;
	#*[a-z]|*[A-Z])
	#	echo "Eso es un texto!";;
	[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][A-Z])
		echo "Tu DNI es: $edad";;
	*"@"*"."*)
		echo "Tu email es $edad";;
	*)
		echo "Lo que no has introducido no es valido";;
esac
