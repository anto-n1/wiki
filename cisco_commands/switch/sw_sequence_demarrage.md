# Séquence de démarrage d'un commutateur

Dès qu'un commutateur est mis sous tension, il exécute la séquence de démarrage suivante :

1. D'abord, le commutateur exécute un programme de Power-On Self Test (POST) stocké dans la mémoire ROM. Le POST contrôle le sous-système du processeur. Il teste le processeur, la mémoire vive dynamique et la partie du périphérique flash qui compose le système de fichiers flash.

2. Le commutateur exécute ensuite le bootloader. Le bootloader est un petit programme stocké dans la mémoire morte qui est exécuté immédiatement après la réussite du POST.

3. Il effectue l'initialisation de bas niveau du processeur. Il initialise les registres du processeur qui contrôlent l'emplacement auquel la mémoire physique est mappée, la quantité de mémoire et sa vitesse.

4. Le bootloader initialise le système de fichiers flash sur la carte système.

5. Finalement, le chargeur de démarrage localise et charge dans la mémoire une image par défaut du logiciel du système d’exploitation IOS et donne le contrôle du commutateur à l’IOS.

Le bootloader recherche l'image Cisco IOS sur le commutateur comme suit : le commutateur tente de démarrer automatiquement en utilisant la variable d'environnement BOOT. Si cette variable n'est pas définie, le commutateur tente de télécharger et d'exécuter le premier fichier exécutable trouvé en effectuant une recherche récursive en profondeur d'abord sur l'ensemble du système de fichiers Flash. Dans une recherche en profondeur d'abord sur un répertoire, chaque sous-répertoire fait l'objet d'une recherche complète avant que la recherche dans le répertoire racine ne se poursuive. Sur les commutateurs de la gamme Catalyst 2960, le fichier d'image se trouve normalement dans un répertoire portant le même nom que l'image (à l'exception de l'extension de fichier .bin).

Le système d'exploitation IOS initialise ensuite les interfaces à l'aide des commandes Cisco IOS figurant dans le fichier de configuration initiale, qui est stocké dans la mémoire NVRAM.

* **Choisir un fichier de démarrage**
	```
	(config)# boot system flash:/c2960-lanbasek9-mz.150-2.SE/c2960-lanbasek9-mz.150-2.SE.bin
	```

* **Afficher le réglage actuel du fichier de démmarage**
	```
	# show boot
	```

* **Afficher les répertoires dans le chargeur d'amorçage**
	```
	# dir flash:
	```