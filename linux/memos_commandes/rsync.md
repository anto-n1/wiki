# Commande rsync

**Récapitulatif arguments principaux pour rsync**

### Différents arguments

* **-a** : plusieurs significations en un drapeau
	+ **-r** : récursif
	+ **-l** : recréer les liens symboliques
	+ **-p** : recopier les permissions
	+ **-t** : transférer les modifications
	+ **-go** : groupes et utilisateurs

* **-h** : afficher les informations en format humain
* **-P** : afficher la barre de progression
* **-z** : compresser pour l'envoie réseau plus rapide - demande plus de travail aux machines
* **--delete** : supprimer les fichiers pour véritable synchronisation
* **--delete-after** : supprimer les fichiers pour véritable synchronisation après avoir fait le transfère  
* **--exclude=file.txt** : ne pas inclure certains fichiers
* **--exclude ".\*/"** : ne pas inclure les dossiers commençant par un point (dossiers cachés)
* **--exclude "/dossier1/dossier2"** : ne pas inclure dossier2
* **-b** : backup -> garder une copie des fichiers sauvegardés
* **-n** ou **--dry-run** : voir ce qu'il ferait sans le faire

### Informations

Dossier/ -> tous les fichiers dans le dossier  
Dossier -> le dossier entier  