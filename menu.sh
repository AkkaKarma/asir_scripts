#!/bin/bash

################################################
# Menu de opciones con case, while y funciones #
################### Esteban ####################

##################### FUNCIONES #####################

function ping-gateway()
{
	read -p "Introduce el gateway: " gateway
	ping -c 5 $gateway

}

function datosusuario()
{
	read -p "Introduce tu nombre de usuario: " nick
	if grep -qw $nick /etc/passwd; then
		echo "Usuario ($nick) encontrado!"
		grep -w $nick /etc/passwd
	else
		echo "[X] El usuario $nick no existe!"
	fi
}

function printmenu() 
{
	echo -e "############## MENU DE OPCIONES v1 ##############\n# a) Ping a gateway                             #\n# b) Check de usuario                           #\n# c) IP del equipo                              #\n# d) Consultar ID de un usuario                 #\n# e) Salir                                      #\n################# By Esteban <3 #################\n" | lolcat -a -s 40 -p 5	

}

function iplocal()
{
	ip=`ip route | grep -w "default via" | tr " " "-" | cut -f9 -d"-"`
	echo "La IP del equipo es: $ip"
}

function ID_user()
{
	read -p "Introduce el usuario del que quieres sacar el ID: " user
	id=`cat /etc/passwd | grep -w $user | cut -f3 -d":"`
	echo "El usuario $user tiene el ID $id"
}
################# Inicio del Script #################
opcion=""
while [ -z $opcion ] || [ $opcion != "e" ] || [ $opcion != "E" ]; do
	clear
	printmenu
	read -n 1 -p $'Qué desea hacer? \n' opcion
	case $opcion in
		a|A)
			echo
			ping-gateway
			read -p "Pulse una tecla para continuar..."
		;;
		b|B)
			echo
			datosusuario
			read -p "Pulse una tecla para continuar..."
		;;
		c|C)
			echo
			iplocal
			read -p "Pulse una tecla para continuar..."
		;;
		d|D)
			echo
			ID_user
			read -p "Pulse una tecla para continuar..."
		;;
		e|E)
			echo
			figlet "Adioos" | lolcat && sleep 1 && clear
			exit 0
		;;
		*)
			echo
			echo "Opcion no válida"
			echo "Regresando al menu.."
			sleep 1
		;;
	esac
done
