# Débuter avec LaTeX

Document comprenant les bases à connaître pour débuter LaTeX.  
Ce document est écrit à partir du livre "**Apprends LATEX !**" de **Marc Baudoin**.

## Commandes de base

Structure des commandes et arguments :  
```
\commande[argumentOptionnel]{argumentObligatoire1,arg2}
```

### Première ligne

* ```\\documentclass``` : Définit type du document et influe sur sa mise en page.  

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

### Préambule et extensions

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

### Le document

Le document est situé entre **\\begin{document}** et **\\end{document}**. Tout texte placé après **\\end{document}** est ignoré.  

* Paragraphes et mots  
Seules les **lignes blanches** permettent de créer un nouveau parapraphe. Les fait d'aller à la ligne n'a aucune incidence sur le paragraphe final. Retour à la ligne est considéré comme un espace. Plusieurs espaces produit la même choque qu'un seul espace.  

* Espace insécable  
Pour pas que deux mois soient séparés en fin de ligne, il est possible de les coller avec le caractère **~**.  
En cas d'erreur suivante :  
```Overfull \hbox (63.46103pt too wide) in paragraph at lines 99--99```  
Il faut utiliser l'espace insécable comme ceci :  
```Je veux cou\-per ici.```

* Les caractères réservés  
Possibilité des les échapper avec un **\\** placé avant le mot ou caractère.  

* Commentaires  
Insertion des commentaires avec le caractère **%**.  

## Les commandes

### Commandes de base

* **Titre :** ```\title{titre}```
* **Auteur :** ```\author{auteur}``` - Séparer avec ```\and``` si plusieurs auteurs.
* **Date :** ```\date{01/02/2020}```- La date du jour est affichée automatiquement, pour ne pas l'afficher utiliser la commande ```\date{}```.
* **Note de bas de page :** ```\title{Titre avec note\thanks{voici la note}}```

### Hiérarchisation du document

Commandes pour hiérarchiser un document :  

* Partie : ```\part{nom}```
* Châpitre : ```\chapter{nom}``` - non disponible pour la classe article
* Section : ```\section{nom}```
* Sous-section : ```\subsection{nom}```
* Sous-sous-section : ```\subsubsection{nom}```

Les numéros des châpitres et sections sont générés automatiquement. La taille de la police sera aussi différent. **Pas besoin de se soucier de la numérotation des châpitres et sections**.  

Si on ne veut pas numéroter, utiliser la commande étoilée : ```\chapter*{Avant propos}```. Cela sert pour les petits rapports. Par défaut, cela n'apparaît pas dans la table des matières mais on peut le rajouter avec ```\addcontentsline{toc}{niveau}{titre}```. Il faut remplacer **niveau** par **part, chapter, section, subsection, subsubsection**. Exemple pour inclure l'avant propos dans la table des matières :  
```
\chapter*{Avant-propos}
\addcontentsline{toc}{chapter}{Avant-propos}
```  

La table des matières s'affiche avec la commande ```\tableofcontents```. Deux compilations sont nécessaires pour afficher la table des matières. La première compilation enregistre la table des matières dans un fichier **.toc** et la seconde l'inclut dans le document. **.toc** pour **table of contents**.  

La commande ```\listoftables``` imprime la liste des tableaux, et ```\listoffigures``` la liste des figures. Pareil que pour la table des matières, deux compilations sont nécessaires, avec des fichiers **.lot** et **.lof**.  

La commande ```\appendix``` permet de définir une annexe. Elles sont numérotées A, B, C.  

### Construire document avec plusieurs fichiers

La commande ```\include{fichier.text}``` permet d'inclure un document dans un autre. Cela peut-être util pour écrire un châpitre par fichier par exemple. Include se place avant le ```\end{document}```. Include génère une nouvelle page. Si on ne veut pas générer de nouvelle page il faut utiliser la commande ```\input{fichier}```.  

### Annotation de document

* Note de bas de page : ```\footnote{note}``` - LaTeX numérote automatiquement.  
* Note dans la marge : ```\marginpar[texte de gauche]{texte de droite}```  

### Références croisées

* Label : ```\label{nom}``` - place repère invisible à l'impression sur l'objet du document auquel on se réfère.
* Référence : ```ref{nom}``` - faire référence au numéro de l'objet repéré par __nom__. Il doit d'agir de quelque chose de numéroté.
* Référence de page : ```\pageref{nom}``` - faire réfénrence au numéro de la page où se trouve le repère __nom__.
* Référence au numéro de paragrapge : ```\ref{section/references}``` - ici on affiche le numéro du paragraphe.
* Référence au numéro de la page où est situé le paragraphe : ```\pageref{section/references}```

### Caractères spéciaux

* Ensemble vide : ```\o``` ou ```\O```
* 'oe' collés : ```\oe```
* Beta : ```\ss```
* LaTeX ou Tex : ```\LaTeX``` ou ```\TeX``` 
* Euro : ```\EUR{10}``` ou ```\euro\``` - extension **eurosym** nécessaire.

**Attention**, une commande sans argument ne prend pas en compte les espaces, il faut donc utiliser les commandes d'une des manières suivantes :

* Barre oblique inversée : ```\TeX\```
* Argument vide : ```\TeX{}```
* Accolade : ```{\TeX}```

### Changements de style

Le contenu de ces commandes sont affectées par le style. Pas le reste qui suit la commande.  

* Italique : ```\textit{phrase en italique}```
* Incliné : ```\textsl{incliné}``` - sl pour slanted
* Petites capitales : ```\textsc{texte}``` - sc pour small caps
* Maigre : ```\textmd{texte}``` - md pour medium
* Gras : ```\textbf{texte}``` - bf pour boldface
* Linéal : ```\textsf{texte}``` - sf pour sans serif
* Machine à écrire : ```\texttt{texte}``` - tt pour typewriter

Possibilité d'imbriquer les commandes de style : 
```
Ceci est mon \textsl{mon texte \texttt{avec double} style.}
```

### Mise en page

* Nouvelle ligne : ```\newline``` ou ```\\``` - ne pas en abuser, préférer la ligne blanche
* Nouvelle page : ```\newpage``` ou ```\clearpage```

### Définition de nouvelles commandes

Possibilité de définir des nouvelles commandes pour appliquer des styles.   
La définition des commandes se fait dans le préambule généralement.  

```
\newcommand{\macommande}[nombre d'arguments]{définition}
\newcommand{\test}{test} % Affiche 'test' à chaque fois que la commande \test est appelée
\newcommand{\latin}[1]{\textit{#1}} % Affiche l'argument de la commande \latin en italique
```


## Les environnements

Les commandes gèrent des mots ou des petites phrases.  
Lorsque l'on souhaite appliquer des modifications sur des grandes parties ou textes, on utilise des syntaxes d'environnement.  

```
\begin{environnement}
\end{environnement}
```

Exemple : 

```
\begin{quotation}
Ce texte est entre quote
Il met des alinéas aux paragraphes.
\end{quotation}
```

Environnements : 
* verse : pour la poésie
* center : centrer le texte
* flushleft, flushright : mettre le texte à droite ou à gauche
* verbatim : afficher le texte complet, ne prends pas en compte les commandes

Créer une liste :
La commande ```\item``` imprime un tiret, ```\enumerate``` un numéro.

```
\begin{itemize}
\item de structurer ses idées ;
\item d’aérer le texte ;
\item d’améliorer sa lisibilité.
\end{itemize}
```

### Les tableaux

Commencer un tableau : ```\begin{tabular}``` et finir avec ```\end{tabular}```.

Arguments :
* Centrer : ```c``` - centrer le texte
* Droite et gauche : ```r``` - pour right et ```l``` pour gauche
* Taille de la colonne : ```p{taille}``` - exemple ```p{5cm}```
* 
* Utiliser ```|``` entre les arguments de ```tabular``` pour tracer des lignes verticale

Corps du tableau :  
* Penser à terminler une ligne avec ```\\```  
* Séparer les valeurs par ```&```
* Utiliser des lignes horizontale pour délimiter le tableau avec ```\hline```
* Laisser une case vide : ```\cline{2-3}``` - trace une ligne entre les colonnes 2 et 3
* Mutlicolomn ```\multicolomn{nombre}{format}{texte}``` permet d'étendre un tableau sur plusieurs colonnes, et aligner une case pour supprimer certains filets verticaux

Exemple de tableau complet :  

```
\begin{tabular}{|p{5cm}|*{2}{c|}}
\cline{2-3}
\multicolumn{1}{c|}{}       & \multicolumn{2}{c|}{Commande} \\
\cline{2-3}
\multicolumn{1}{c|}{}       & Contenance & Quantité \\
\hline
\bfseries Blanche de Bruges &   33 cl         &   10   \\
\hline
\bfseries Guinness          &     1 pint      &    5   \\
\hline 
\bfseries Kronenbourg       &     33    cl    &    0    \\
\hline
\end{tabular}
```

### Les environnements table et figure

Les environnements table et figure permettent de faire flotter des tableau et figures, pour les déplacer, mais aussi leur donner un titre et les numéroter.  
Important de pouvoir faire flotter car sinon LaTeX ne les coupe pas en bas de page, ils peuvent donc dépasser.  

Arguments : 
* ```!``` demande à LaTeX de rescpecter l'ordre indiqué ensuite
* ```h``` (here) ici, si possible
* ```t``` (top) en haut d'une page, celle-ci ou la suivante
* ```b``` (bottom) en bas d'une page, celle-ci ou la suivante
* ```p``` (page of floats) sur une page spéciale ne contenant que des tableaux et figures

On met donc généralement ```[!tpb]``` pour placer le tableau dans la mesure du possible conformément à sa position dans le document.  

Quelques commandes :

* ```\centering``` : centrer le tableau
* ```\caption``` : donner une légende au tableau ou à la figure
* ```\label``` : placée **obligatoirement** après ```\caption``` permet de lui faire référence grâce aux commandes ```\ref``` ou ```\pageref```

Faire figurer la liste des tableaux et figures se fait comme vu précédemment avec les commandes ```\listoftables``` et ```\listoffigures```.  

Exemple avec le tableau précédent :
```
\begin{table}[!htbp]
\centering
\begin{tabular}{|l|l|}
\hline
table  & figure \\
\hline
tableaux & dessins \\
\hline
\end{tabular}
\caption{Exemple d’environnement \environnement{table}}
\label{tableau/exemple}
\end{table}
```

### Personnaliser la page de titre

La commande ```\maketitle``` propose un titre minimale, qu'il est possible de modifier.  

Possible avec l'environnement ```titlepage``` :

* Environnement ```center``` pour centrer le texte
* Changer les tailles avec ```\large```
* Espacement avec ```\vspace``` et ```\hspace``` pour aérer le texte
* ```\includegraphique``` permet d'inclure une image

**Attention**, l'environnement ```titlepage``` doit se trouver juste après la commande ```\begin{document}```

### Définition de nouveaux environnements

Pssibilité de définir de nouveau environnements grâce à la commande ```\newenvironment{nom}[nombre d'arguments]{définition de début}{définition de fin}```. On place généralement ces commandes dans le préambule. Lorsque LaTeX recontrera ```\begin{nom}``` il remplacera par ```définition de début``` et pareil pour la fin.  

Exemple :
```
\newenvironment{italitemize}
{\begin{itemize} \itshape}
{\end{itemize}}
```
