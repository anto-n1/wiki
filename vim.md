# VIM - Vi IMproved

Le meilleur editeur de texte jamais créé.

## Sens des lettres

**d** – delete, supprimer  
**c** – supprimer et passer en mode insertion  
**w** – mot suivant  
**$** – fin de ligne  
**0** – début de ligne  
**^** – premier caractère non blanc  
**k** – ligne précédente  
**j** – ligne suivante  
**v** – mode visuel  

## Recherche

| Syntaxe | Signification |
| --- | --- |
| /texte | recherche le mot « texte » dans le fichier |
| n | déplacement à l'occurrence suivante |
| N | déplacement à l'occurrence précédente |
| \* | cherche le mot placé sous le curseur (vers l'avant) |
| # | cherche le mot placé sous le curseur (vers l'arrière) |

Les occurrences sont surlignées.  
La recherche n'est pas sensible à la casse sauf si une majuscule est tapée dans le champs de saisie.  
Préfixer les caractères spéciaux dans la recherche par "\\".

## Fenêtrage

| Syntaxe | Signification |
| --- | --- |
| :tabnew fichier | ouvre le fichier fichier dans un nouvel onglet |

## Sauver, charger, quitter

| Syntaxe | Signification |
| --- | --- |
| :w | sauve le fichier en cours d&#39;édition |
| :w fichier | écrit le texte dans le fichier fichier |
| :sav fichier | sauve le fichier sous un nouveau nom |
| :ed fichier | édite un nouveau fichier |
| :q | quitte |
| :x | sauve si nécessaire et quitte |
| :wq | sauve et quitte |
| :q! | quitte sans enregistrer |
| :e fichier | créé un nouveau fichier |

## Annuler / Refaire

| Syntaxe | Signification |
| --- | --- |
| u | annule la dernière opération |
| ctrl+r | annule le annuler (refaire) |

## Déplacements

**J** – gauche  
**K** – bas  
**L** – haut  
**M** - droite  

| Syntaxe | Signification |
| --- | --- |
| e | à la fin du mot courant |
| b | au début du mot courant |
| w | au début du mot suivant |
| ^  | au premier caractère non blanc au-dessus de la ligne |
| $ | à la fin de la ligne |
| 0 | au début de la ligne |
| G | va à la dernière ligne |
| nj | se déplace de n lignes vers le bas |
| gg | va au début du fichier |
| 34 | se rendre à la ligne 34 |
| dw | supprime les caractères jusqu'au prochain mot |
| cw | supprime les caractères jusqu'au prochain mot et passer en mode insertion |
| d$ | supprime jusqu'à la fin de la ligne |
| d^        | supprime jusqu'au début de la ligne |
| x | supprime le caractère sous le curseur |
| dd | supprime la ligne courante et copie dans le presse papier |
| nd | supprime n ligne suivantes (ex : 3d supprime les 3 lignes suivantes) |
| nG | va à la ligne n (ex : 5G va à la ligne 5) |

## Insertion

| Syntaxe | Signification |
| --- | --- |
| i | mode insertion avant l'emplacement du curseur |
| a | mode insertion après l'emplacement du curseur |
| I | mode insertion au début de la ligne |
| A | mode insertion à la fin de la ligne |
| o | insère une nouvelle ligne en dessous de la ligne courante |
| O | insère une nouvelle ligne au-dessus de la ligne courante |
| r | remplace les caractères sous le curseur |

## Copiage/Collage (être en mode visuel pour copier)

| Syntaxe | Signification |
| --- | --- |
| y | copie la sélection |
| p | colle après le curseur |
| P | colle avant le curseur |
| 2yy | copie deux lignes dans le presse-papier |
| d | couper la sélection |
| yw | copie les caractères jusqu'au prochain mot |
| y$ | copie jusqu'à la fin de la ligne |
| y^        | copie jusqu'au premier caractère non blanc de la ligne |

## Suppression

| Syntaxe | Signification |
| --- | --- |
| x | efface le caractère sous le curseur |
| X | efface le caractère avant le curseur |
| dd | efface la ligne courante et la place dans le presse papier |
| 3x | efface 3 caractères vers l'avant du curseur |
