#!/bin/bash

#####################################
# Uso del bucle for in              #
# Crea un bucle for in que salude a #
# todos los usuarios del sistema    #
#####################################

listausers=`cat /etc/passwd | cut -f1,3 -d":"`

for usuario in $listausers; do
	nick=`echo $usuario | cut -f1 -d":"`
	id=`echo $usuario | cut -f2 -d":"`
	echo "Hola $nick! Tu ID es $id"
done
