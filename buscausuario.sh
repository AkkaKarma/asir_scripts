#!/bin/bash

################ 01 - 10 - 25 #################
# Busca un usuario introducido por teclado en #
# el fichero passwd                           #
################## Esteban ####################

nick=""

echo "########## BUSCADOR DE USUARIOS ##########"

while  [ "$nick" == "" ]; do # Bucle que verifica que la variable no se quede vacia
	read -p "Introduce el nickname del usuario a buscar: " nick
done

echo "Buscando al usuario $nick..."
sleep 1

# Grep al usuario introducio en fichero passwd para verificar que existe
if cat /etc/passwd | cut -f1 -d":" | grep -wq $nick; then
	echo "[V] El usuario existe"
else
	echo "[X] El usuario no existe"
fi
