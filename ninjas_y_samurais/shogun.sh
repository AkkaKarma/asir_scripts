#!/bin/bash

#####################
# Este es el shogun #
#####################

for samurai in `ls samurais`; do
	xterm -hold -e samurais/$samurai &
done
