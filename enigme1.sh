#!/bin/bash
#****
# Script : 
# Description : 
#
# Date : 16/09/2021
# Version : 1.0
# Auteur : Liliana Santos, Ania Marostica
#****

shopt -s -o nounset

dateJour=$(date +%Y-%m-%d)

regex=${dateJour}

declare result;

result=$(grep $regex testCM.csv | cut -d ";" -f "2" )

echo $result

if [[ -n "$result" ]]
then
	rm -r /home/lilianasntss/test/*
	mv /home/lilianasntss/$result.PNG /home/lilianasntss/test/$result.PNG
else
	echo "la variable est vide"
fi
