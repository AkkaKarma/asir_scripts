#!/bin/bash

##############################################
# - Solicita por teclado tres usuarios       #
# - Con un bucle forin darlos de alta en el  #
#   sistema                                  #
# - Comprobar que el alta ha sido satisfac-  #
#   toria                                    #
# - Almacenar en un log si el resultado ha   #
#   sido exitosa o no junto a la fecha y     #
#   hora                                     #
##############################################

################ FUNCIONES ################
function log()
{
	fechahora=`date +%Y-%m-%d"\t"%X`
	mensajelog=$fechahora"\t"$1
	echo -e "$mensajelog" >> log_users.log
}
### COMPROBACIÓN DE ROOT ###
if [ `whoami` != "root" ];then
	echo "[X] Error! Debes de ser root para ejecutar este programa"
	exit 1
else
	### Comprobación de logs y creación ###	
	if [ -f log_users.log ]; then
		echo "[V] El log existe! Continuando..."
	else	
		echo "[X] El fichero de logs no existe. Creando..."
		echo "Fichero de logs" >> log_users.log
		echo -e "FECHA \t\t HORA \t\t RESULTADO" >> log_users.log
		echo "[V] Fichero creado con éxito."	
	fi

	#### Inicio del Script ###

	# Declaramos variables y las pedimos al user
	read -p "Introduce tres usuarios separados por espacios [user1 user2 user3]: " usuarios
	echo $usuarios | tr " " "\n" > Usuarios.txt # Con esto almacenaremos los usuarios en el fichero usuarios.txt

	for usuario in `cat Usuarios.txt`; do # Por cada usuario en Usuarios.txt
		if [ `grep -wq $usuario /etc/passwd` ]; then # Comprueba si existe en passwd
			echo "[X] El usuario $usuario existe!"
			log "[X] El usuario $usuario existe!"
		else # Si no existe lo crea
			echo "[V] Creando el usuario..."
			sleep 1
			useradd -m $usuario 
			if [ $? -ne 0 ]; then # Si $? (error) no es 0 logea error en la creación 
				echo "[X] Ha habido un error en la creación del usuario."
				log "[X] Ha habido un error en la creación del usuario." 
			else
				echo "$usuario:$usuario" | chpasswd > /dev/null # Asigna la contraseña al usuario
				passwd -e $usuario > /dev/null # La expira para que se tenga que cambiar al entrar
				echo "[V] El user $usuario ha sido creado con éxito"
				log "[V] El user $usuario ha sido creado con éxito"	
			fi	
		fi
	done
	rm Usuarios.txt
fi
