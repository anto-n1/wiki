# Latex commandes

## Base

Structure des commandes et arguments :  
```
\commande[argumentOptionnel]{argobligatoire1,arg2}
```

## Commandes de base

#### Première ligne

* **\\documentclass** : Définit type du document et influe sur sa mise en page.  

**Argument obligatoire :**  
	* **article** : documents courts (ne gère pas les chapitres)
	* **report** : documents longs (gère les chapitres)
	* **book** : rédaction de livres
	* **slides** : faire des slides  

**Argument optionnel :**  
	* **a4paper** : format feuille A4
	* **french** : langage français
	* **11pt** : taille de la police
	* **twocolumn** : présenter le document sur deux colonnes
	* **twoside** : régler les marges pour l'impression recto-verso (la marge intérieure est dans ce cas plus petite que la marge extérieure)

#### Préambule et extensions

Le préambule est la partie du document comprise entre les commandes **\\documentclass** et **\\begin{document}**. Il contient les commandes de chargement des extensions (package en anglais).  
La commande utilisée pour ajouter une extension est **\\usepackage**.  
Installer le package **texlive-lang-french** via apt pour utiliser l'option french.  

* **\\usepackage[french]{babel}** : Remplace les mots "Chapter" par "Chapitre" et respecte les conventions d'écriture françaises.

* **\\usepackage[utf8]{inputenc}** : Utiliser UTF8.

* **\\usepackage{lmodern}** : Utiliser une police moderne.

* **\\usepackage{microtype}** : Apporte des rafinements typographiques.

* **\\usepackage{hyperref}** : Apporte les possibilité de navigation au sein du PDF (liens internes par exemple)

L'odre de déclarartion des package n'a pas d'importance.  
SAUF **hyperref** qui doit être obligatoirement déclaré en dernier.  

#### Le document

Le document est situé entre **\\begin{document}** et **\\end{document}**. Tout texte placé après **\\end{document}** est ignoré.  

* Paragraphes et mots  
Seules les **lignes blanches** permettent de créer un nouveau parapraphe. Les fait d'aller à la ligne n'a aucune incidence sur le paragraphe final. Retour à la ligne est considéré comme un espace. Plusieurs espaces produit la même choque qu'un seul espace.  

* Espace insécable  
Pour pas que deux mois soient séparés en fin de ligne, il est possible de les coller avec le caractère **~**.  

* Les caractères réservés  
Possibilité des les échapper avec un **\\** placé avant le mot ou caractère.  

	* Commentaires  
	Insertion des commentaires avec le caractère **%**.  


rendu page 18