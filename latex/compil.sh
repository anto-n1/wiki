#!/bin/bash

# Compilation d'un fichier LaTeX

# Usage : ./compil.sh nom_fichier.tex

# Nom du rapport au format fichier.tex
rapport_name=$1

# Nom du rapport sans extension
rapport_name_no_ext=$(echo ${rapport_name} | rev | cut -c5- | rev)

xelatex ${rapport_name}
xelatex ${rapport_name}
bibtex ${rapport_name_no_ext}
#biber ${rapport_name_no_ext}
xelatex ${rapport_name}
xelatex ${rapport_name}

# Suppression des fichiers inutiles
rm -f *.aux *.bbl *.toc *.log *.out *.run.xml *.bib *.blg
