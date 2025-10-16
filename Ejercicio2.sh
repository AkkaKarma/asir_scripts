#!/bin/bash

#############################################
# - Introducir nº usuarios que queremos dar #
#   de alta.                                #
# - Comprobar con while que se introduce un #
#   numero.                                 #
# - Damos alta de tantos usuarios como se   #
#   introduzca en al variable               #
# - Por cada usuario que se cree indicarlo  #
#   en un fichero log                       #
#############################################

################ FUNCIONES ##################

function log {
	fecha=`date +%Y-%m-%d"\t"%X`
	mensaje="\t"$fecha"\t"$1
	echo -e "$mensaje" >> log_ej2.log
}

######### COMPROBACION DE ROOT ##############

if [ $LOGNAME = "root" ]; then
	clear
else
	echo "[X] ERROR! Debes de ser root para ejecutar este programa!"
	exit 1
fi

######### COMPROBACION DE FICHERO LOG ##########

if [ -f log_ej2.log ]; then
	echo "[V] Log existente! Iniciando programa..."
else
	echo "[X] WARNING! Log no existe! Creando log..."
	echo -e "\tFECHA\t\tHORA\t\tMENSAJE" >> log_ej2.log
fi


############## INICIO SCRIPT ################
nusuarios=0
while [[ $nusuarios =~ [0-9]+$ ]]; do
	read -p "Introduce la cantidad de usuarios a dar de alta: " nusuarios
	if [ $nusuarios -le 10 ]; then # COMPROBAR QUE SEA MENOR QUE 10
		break # ROMPER BUCLE SI SE CUMPLE LA CONDICIÓN
	else # SI NO QUE DE ERROR
		echo "[X] Error! El número debe ser igual o menor que 10"
		log "[X] Error! El número debe ser igual o menor que 10"
	fi
done

for ((i=1; i<=$nusuarios; i++));do # BUCLE FOR 
	read -p "Introduce el nombre del usuario a crear: " usernuevo
	read -sp "Introduce la contraseña para el usuario [SE RESTABLECERA EN EL PROXIMO INICIO DE SESION]: " psw
	useradd -m $usernuevo > /dev/null 
	echo "$usernuevo:$psw" | chpasswd > /dev/null
	passwd -e $usernuevo > /dev/null
	if [ $? != 0 ]; then # IF ERROR NO ES 0
		echo "[X] Error al crear el usuario ($usernuevo)."
		log "[X] Error al crear el usuario ($usernuevo)."

	else # SI ES 0
		echo "[V] El usuario $i ($usernuevo) ha sido creado con éxito"
		log "[V] El usuario $i ($usernuevo) ha sido creado con éxito"
	fi
	read -n 1 -p $"Desea ver la linea del passwd relacionada a este usuario? [s/n] " pass
	if [ $pass = "s" ] || [ $pass = "S" ]; then
		echo
		grep -w $usernuevo /etc/passwd
		echo
	fi
done
