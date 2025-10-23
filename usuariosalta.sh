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
for nuser in `cat /etc/passwd | grep -w /bin/bash`; do
	usuario=`cat /etc/passwd | grep -w $nuser | cut -f1 -d":"`
	uid=`cat /etc/passwd | grep -w $nuser | cut -f3 -d":"`
	id=0
	if [ $uid -lt 1000 ]; then
		continue
	fi
	i=`expr $i + 1`
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
