#!/bin/bash

#########################################
# Script para contar los usuarios que   #
# hay en el sistema y su UID            #
#########################################

echo -e "Nº\t| USUARIO\t| UID"
echo -e "Nº\t| USUARIO\t| UID" > usuarios.txt

#############################################
function printuser {
	echo -e "$i\t| $usuario\t| $uid"
}
#############################################

echo "--------|---------------|------"
echo "--------|---------------|------" >> usuarios.txt

################ Mostrar usuarios y guardarlos ################
for nuser in `cat /etc/passwd | grep -w /bin/bash`; do # por cada usuario que use /bin/bash hacer:
	usuario=`cat /etc/passwd | grep -w $nuser | cut -f1 -d":"` # Almacena el nombre del usuario
	uid=`cat /etc/passwd | grep -w $nuser | cut -f3 -d":"` # Almacena UID del user
	id=0 # Contador
	if [ $uid -lt 1000 ]; then # SI el UID es menor que 1000 continuar bucle
		continue
	fi
	i=`expr $i + 1` # Sumar al contador
	printuser
	printuser >> usuarios.txt
done

read -n 1 -p "Desea introducir los usuarios en un fichero? [S/N] " fichero
if [ $fichero == "S" ] || [ $fichero == "s" ]; then
	echo
	echo "Usuarios almacenados en usuarios.txt!"
else 
	rm -rf usuarios.txt
	echo
fi
