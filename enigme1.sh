#!/bin/bash
#****
# Script : 
# Description : 
#
# Date : 27/09/2021
# Version : 1.0
# Auteur : Liliana Santos, Ania Marostica
#****

shopt -s -o nounset


dateJour=$(date +%Y-%m-%d)

regex=${dateJour}


#declaration des variables
declare result
declare valeurDefaut=6
declare nomDossier=TOP_SECRET


#chemin vers le desktop
cd ..
cd ..
cd /mnt/c/Users/CM2021/Desktop

#function pour la creation des dossiers
function dossier(){
	mkdir $nomDossier 
	mkdir $nomDossier/A $nomDossier/B $nomDossier/C $nomDossier/D $nomDossier/E
#*********************** A
	mkdir $nomDossier/A/B $nomDossier/A/C $nomDossier/A/D $nomDossier/A/E
	
	mkdir $nomDossier/A/B/C $nomDossier/A/C/E $nomDossier/A/D/B
	
	mkdir $nomDossier/A/C/E/A $nomDossier/A/D/B/D
	
	mkdir $nomDossier/A/D/B/D/B
#*********************** B
	mkdir $nomDossier/B/A $nomDossier/B/B $nomDossier/B/D
	
	mkdir $nomDossier/B/A/D $nomDossier/B/A/C $nomDossier/B/B/A
	
	mkdir $nomDossier/B/D/E $nomDossier/B/D/C $nomDossier/B/D/D
	
	mkdir $nomDossier/B/D/C/A
#*********************** C
	mkdir $nomDossier/C/A $nomDossier/C/F
	
	mkdir $nomDossier/C/F/P $nomDossier/C/F/P/T
#*********************** D
	mkdir $nomDossier/D/A $nomDossier/D/C $nomDossier/D/E $nomDossier/D/D
	
	mkdir $nomDossier/D/C/A
	
	mkdir $nomDossier/D/D/B $nomDossier/D/D/D
#*********************** E
	mkdir $nomDossier/E/A $nomDossier/E/B $nomDossier/E/C $nomDossier/E/D
	
	mkdir $nomDossier/E/A/D
	
	mkdir $nomDossier/E/B/A $nomDossier/E/B/C $nomDossier/E/B/E
	
	mkdir $nomDossier/E/B/A/C $nomDossier/E/B/A/B $nomDossier/E/B/A/A $nomDossier/E/B/A/D
	
	mkdir $nomDossier/E/B/A/C/D
	
	mkdir $nomDossier/E/C/A
	mkdir $nomDossier/E/C/B
	
	mkdir $nomDossier/E/C/A/D
	mkdir $nomDossier/E/C/A/D/C
	mkdir $nomDossier/E/C/A/D/E
	
	mkdir $nomDossier/E/C/A/D/B
}

# si existe  un dossier qui se appelle commme $nomDossier
if [ -d $nomDossier ]
then
	#supprimer et creer les dossiers
	rm -r $nomDossier
	dossier
else
	#creer les dossiers 
	dossier
fi 

#aller vers le dossier enigme1 dans wsl
cd
cd enigme1

#sauvegarder dans la variable le 2 champ du document escapegame_2021.csv
result=$(grep $regex escapegame_2021.csv | cut -d ";" -f "2" )


#si a variable n'est pas vide
if [[ -n "$result" ]]
then 
	rm -r /mnt/c/Users/CM2021/Desktop/$nomDossier/E/B/A/C/D/*
	cp /mnt/c/Users/CM2021/Desktop/imagesEnigme/$result.PNG /mnt/c/Users/CM2021/Desktop/$nomDossier/E/B/A/C/D/$result.PNG
	cp /mnt/c/Users/CM2021/Desktop/imagesEnigme/ListeDeMateriel /mnt/c/Users/CM2021/Desktop/$nomDossier/E/C/A/D/B/ListeDeMateriel
else
	echo $valeurDefaut
	rm -r /mnt/c/Users/CM2021/Desktop/$nomDossier/E/B/A/C/D/*
	cp /mnt/c/Users/CM2021/Desktop/imagesEnigme/$valeurDefaut.PNG /mnt/c/Users/CM2021/Desktop/$nomDossier/E/B/A/C/D/$valeurDefaut.PNG
	cp /mnt/c/Users/CM2021/Desktop/imagesEnigme/ListeDeMateriel.txt /mnt/c/Users/CM2021/Desktop/$nomDossier/E/C/A/D/B/ListeDeMateriel.txt
fi



