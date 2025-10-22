#!/bin/bash

#########################################
# Script para contar los usuarios que   #
# hay en el sistema y su UID            #
#########################################

echo -e "Nº\t| USUARIO\t| UID"

function printuser {
	echo -e "$i\t| $usuario\t| $uid"
}
i=0
echo "--------|---------------|------"
for nuser in `cat /etc/passwd | grep -w /bin/bash`; do
	usuario=`cat /etc/passwd | grep -w $nuser | cut -f1 -d":"`
	uid=`cat /etc/passwd | grep -w $nuser | cut -f3 -d":"`
	if [ $uid -lt 1000 ]; then
		continue
	fi
	i=`expr $i + 1`
	printuser
done



