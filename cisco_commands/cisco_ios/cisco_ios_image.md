# Image Cisco IOS

```show flash0:``` affiche le nom de l'image Cisco IOS qui tourne sur l'équipement.  

L'image suivante présente le découpage d'un nom d'image Cisco :

![Cisco IOS image](.images/cisco_image_ios.png "Cisco IOS image")  

## Commande boot system

Pour effectuer une mise à niveau vers l'image IOS copiée après son enregistrement dans la mémoire Flash du routeur, configurer le routeur de façon à charger la nouvelle image pendant le démarrage à l'aide de la commande ```boot system```. Enregistrer la configuration. Redémarrer le routeur pour qu'il démarre avec la nouvelle image. Une fois le routeur démarré, pour vérifier le chargement de la nouvelle image, utiliser la commande ```show version```.

Au démarrage, le code bootstrap analyse le fichier de configuration initiale dans la mémoire vive non volatile à la recherche des commandes boot system qui indiquent le nom et l'emplacement de l'image du logiciel Cisco IOS à charger. Plusieurs commandes boot system peuvent être saisies successivement pour créer un plan d'amorçage à tolérance de panne.

En l'absence de commandes boot system dans la configuration, le routeur charge par défaut la première image Cisco IOS valide dans la mémoire Flash et l'exécute.

* **Choisir une image sur laquelle démarrer**
	```
	(config)# boot system flash0://c1900-universalk9-mz.SPA.152-4.M3.bin
	```