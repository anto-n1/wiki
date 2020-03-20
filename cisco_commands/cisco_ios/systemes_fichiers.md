# Cisco IFS (IOS File System)

## Systèmes de fichiers

* **Système de fichiers Flash** :

Le système de fichiers Flash étant le système de fichiers utilisé par défaut, la commande ```dir``` en affiche le contenu. Plusieurs fichiers figurent en mémoire Flash, mais seule la dernière liste nous intéresse. Il s'agit du nom de l'image en cours des fichiers Cisco IOS qui s'exécute dans la mémoire vive. La mémoire Flash ne perd pas son contenu lors d'un redémarrage. 

* **Système de fichiers NVRAM** :

Pour afficher le contenu de la mémoire vive non volatile (NVRAM), il faut modifier le système de fichiers par défaut à l'aide de la commande ```cd```. La commande ```pwd``` confirme que nous consultons le répertoire NVRAM. Enfin, la commande ```dir``` affiche la liste du contenu de la mémoire non volatile NVRAM. Parmi les différents fichiers affichés, le seul qui présente un intérêt pour nous est le fichier nommé « startup-config » qui définit la configuration de démarrage.

* **Mémoire morte (ROM)** : 

Mémoire non volatile utilisée pour conserver une version limitée de l’IOS, les procédures d’amorce et les logiciels de diagnostic de base.

* **Mémoire vive (RAM)** : mémoire volatile utilisée pour stocker l’IOS, le fichier de configuration en cours, la table de routage et le tableau de protocole ARP. Elle sert aussi de tampon pour les paquets.

La commande ```show file systems``` affiche le système de fichiers.

## Supports externes

* **Afficher les supports USB**
	```
	# dir usbflash0:
	```