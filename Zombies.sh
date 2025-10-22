#!/bin/bash

############################################
# Script que cuente los zombies que hay en #
# el sistema usando top y que haga un      #
# sonido de zombie                         #
############################################


while [ 1 ]; do
	nzombies=`top -b -n1 | grep -w "zombie" | tr " " ":" | rev | cut -f2 -d":" | rev`
	if [ $nzombies -gt 0 ]; then
		mpg123 -q res/zombie.mp3
	fi

	echo "Hay $nzombies zombies en el sistema"
done
