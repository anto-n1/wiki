# Récupération de mots de passe

Les mots de passe des périphériques permettent d'empêcher les accès non autorisés. Les mots de passe chiffrés, tels que les mots de passe secrets chiffrés, doivent être remplacés après récupération. Selon le périphérique, la procédure détaillée de récupération des mots de passe varie ; toutefois, toutes les procédures de récupération des mots de passe suivent le même principe :

1. Activer le mode ROMMON.

2. Modifier le registre de configuration en 0x2142 pour ignorer le fichier de configuration de démarrage.

3. Apporter les modifications nécessaires au fichier de configuration de démarrage initial.

4. Enregistrer la nouvelle configuration

La console d'accès permet à l'utilisateur d'accéder au mode ROMMON au moyen d'une séquence de pause pendant le processus de démarrage ou en retirant la mémoire flash externe au moment de la mise hors tension du périphérique.

Le logiciel ROMMON prend en charge certaines commandes de base, telles que la commande confreg. La commande confreg 0x2142 permet à l'utilisateur de régler le registre de configuration sur 0x2142. Une fois le registre de configuration sur 0x2142, le périphérique ignorera le fichier de configuration initiale au démarrage. Le fichier de configuration de démarrage est l'endroit où les mots de passe oubliés sont enregistrés. Une fois le registre de configuration défini sur 0x2142, tapez reset à l'invite pour redémarrer le périphérique. Saisissez la séquence de pause au moment où le périphérique redémarre et décompresser l'IOS. La Figure 1 montre la sortie du terminal d'un routeur 1941 en mode ROMMON après utilisation d'une séquence de pause au cours du processus de démarrage.

* **Récupération de mots de passe**
	```
	rommon 1> confref 0x2142
	rommon 2> reset
	# copy startup-config running-config
	# conf t
	(config)# enable secret cisco
	(config)# config-register 0x2102
	(config)# end
	# copy startup-config running-config
	```