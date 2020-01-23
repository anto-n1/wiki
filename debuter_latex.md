# Latex commandes

## Base

Structure des commandes et arguments :  
```
\commande[argumentOptionnel]{argobligatoire1,arg2}
```

## Commandes de base

* **\\documentclass** :
Définit type du document et influe sur sa mise en page.  
**Argument obligatoire** :  
	* **article** : documents courts (ne gère pas les chapitres)
	* **report** : documents longs (gère les chapitres)
	* **book** : rédaction de livres
	* **slides** : faire des slides
**Argument optionnel** :  
	* **a4paper** : format feuille A4
	* **french** : langage français
	* **11pt** : taille de la police
	* **twocolumn** : présenter le document sur deux colonnes
	* **twoside** : régler les marges pour l'impression recto-verso (la marge intérieure est dans ce cas plus petite que la marge extérieure)
