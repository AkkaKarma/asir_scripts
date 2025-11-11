#!/bin/bash

ocupacion=`df -h | grep -w "/" | tr -s " " ":" | cut -f5 -d":" | tr "%" " "`

echo $ocupacion
