#!/bin/bash

# Compilation d'un fichier LaTeX

# Usage : ./compil.sh nom_fichier.tex

# Nom du rapport au format fichier.tex
rapport_name="Rapport.tex"

# Nom du rapport sans extension
rapport_name_no_ext=$(echo ${rapport_name} | rev | cut -c5- | rev)

xelatex ${rapport_name}

if [ "$?" == 0 ]
then
    xelatex ${rapport_name}
    if [ "$?" == 0 ]
    then
        #bibtex $rapport_name_no_ext 
        biber $rapport_name_no_ext
        if [ "$?" == 0 ]
        then
            xelatex ${rapport_name}
            xelatex ${rapport_name}
        else
            echo "Erreur de compilation des sources."
        fi
    else
        echo "Erreur de compilation du fichier."
    fi
else
    echo "Erreur de compilation du fichier."
fi

# Suppression des fichiers inutiles
rm -f *.aux *.bbl *.toc *.log *.out *.run.xml *.blg *blx.bib *.lof *.bcf
