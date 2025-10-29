#!/bin/bash

####################
# Este es el ninja #
####################

for samurai in `ps aux | grep "samurai" | tr " " ":" | cut -f4 -d":"`; do
	echo "Samurai encontrado: $samurai"
	kill -9 $samurai
done
