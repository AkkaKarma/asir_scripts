#!/bin/bash

############### 24/09/25 #################
# Script que pida al usuario dos números #
# y muestre el mayor numero por pantalla #
# Además almacenará todo en un fichero   #
# de logs y tendrá verificación de las   #
# variables                              #
############### Esteban ##################


########################## FUNCIONES ####################################

function insertarlog() { #FUNCION PARA ESCRIBIR LAS COSAS EN EL FICHERO LOG

	fecha_actual=`date +%Y-%m-%d"\t"%X` # Almacena fecha en variable con comando date y parametros Y(Year), m(month), d(day), H(Hour), M(Minutes), S(Seconds)
	ip=`ip route | grep -w "default via" | tr " " "-" | cut -f 9 -d "-"` # Almacena la IP del equipo	
	usuario=`whoami`
	textocompleto=$usuario"\t\t"$fecha_actual"\t"$ip"\t\t "$1
	echo -e "$textocompleto" >> log_nums.log
}

#########################################################################

# Comprobación de que existe un fichero de logs, si no, lo crea

if [ -f log_nums.log ]; then
	echo "[V] Log existente! Iniciando script..."
	sleep 2
	clear
else
	echo "Fichero de logs de Script de comparador de numeros" > log_nums.log
	echo -e "USUARIO\t\t FECHA \t\t HORA \t\t IP DEL EQUIPO \t\t Codigo de Error" >> log_nums.log
	echo "[X] Advertencia! No existe el fichero de logs!"
	echo "Creando fichero..."
	sleep 2
	clear
fi

# Pediremos al usuario dos números y los vamos a almacenar 
# insertarlog "[V] Script iniciado!"

read -p "Introduce el primer número: " numero1
read -p "Introduce el segundo número: " numero2

echo "Los numeros que has introducido son $numero1 y $numero2"

# Comprobador de que ambas variables tengan un numero

if [ -z $numero1 ] || [ -z $numero2 ]; then # -z == -zero (vacia)
	echo "Falta algún numero"
	echo "Cerrando programa..."
	insertarlog "[X] Falta un número"
	exit 1
else
	# Comparación de numeros
	if [ $numero1 -eq $numero2 ]; then
		insertarlog "[V] $numero1 y $numero2 son iguales"
		echo "$numero1 y $numero2 son iguales"
		exit 0
	else
		if [ $numero1 -gt $numero2 ]; then
			insertarlog "[V] $numero1 es mayor que $numero2"
			echo "$numero1 es mayor que $numero2"
			exit 0
		else
			insertarlog "[V] $numero2 es mayor que $numero1"
			echo "$numero2 es mayor que $numero1"
			exit 0
		fi
	fi
fi
