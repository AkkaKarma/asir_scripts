#!/bin/bash

############################################
# Script que cuente los zombies que hay en #
# el sistema usando top y que haga un      #
# sonido de zombie                         #
############################################

nzombies=`top -b -n1 | grep -w "zombie" | tr " " ":" | rev | cut -f2 -d":" | rev`

if [ $nzombies -gt 0 ]; then
	mpg123 res/zombie.mp3
fi

echo "Hay $nzombies en el sistema"
