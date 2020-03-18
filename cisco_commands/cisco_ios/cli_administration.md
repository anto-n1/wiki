# Commandes d'administration d'IOS

Ce fichier présente les commandes de base à connaître pour administrer des routeurs et switchs Cisco.

* **Nom d'hôte**
	
	* Ajouter un nom d'hôte :
	```
	# configure terminal
	(config)# hostname sw-name-1
	```

	* Supprimer un nom d'hôte :
	```
	(config)# no hostname
	```

* **Bannière**

	* Mettre une bannière :
	```
	(config)# banner motd ## Ceci est ma bannière ##
	```
	'##' est le délimiteur du message, possibilité de choisir son délimiteur.

* **Mots de passes**

	* Mettre un mot de passe accès privilégié :
	```
	(config)# enable secret <monpassword>
	```

	* Mettre un mot de passe port console :
	```
	(config)# line console 0
	(config)# password <monpassword>
	(config)# login
	```

	* Mettre un mot de passe SSH/Telnet :
	```
	(config)# line vty 0 5
	(config-line)# password <monpassword>
	(config-line)# login local
	```
	'0 5' pour autoriser 6 connexions simultanées.

	* Chiffrer les mots de passe :
	```
	(config)# service password-encryption
	```

* **Configuration**

	* Enregistrer la configuration en cours
	```
	# copy running-config startup-config
	```

	* Afficher la configuration en cours
	```
	# show running-config
	```

	* Afficher la configuration de démarrage
	```
	# show startup-config
	```

	* Revenir à la configuration de démarrage
	```
	# reload
	```

	* Supprimer toute configuration
	```
	# delete flasj:vlan.dat
	# erase startup-config
	```

	* Examiner contenu répertoire flash
	```
	# show flash
	```

	* Analyser un fichier
	```
	# dit flash:nom_fichier
	```

* **Filtrage des commandes show**

	* Filtrer les résultats - équivalent 'grep' Linux
	```
	# show running-config | section line vty
	# show ip interface brief | include up
	# show ip interface brief | exclude unassigned
	# show ip route | begin Gateway
	```
	4 choix possibles :
		1. section : affiche la section qui commence par l'expression de filtrage
		2. include : inclu les lignes qui contiennent l'expression
		3. exlude : exclure les ligne qui contiennent l'expression
		4. begin : affiche les lignes en commençant par la ligne qui correspond à l'expression de filtrage

* **Historique des commandes**

	* Afficher l'historique des commandes tapées
	```
	# show history
	```

	* Changer la taille du tampon de l'historique des commandes
	```
	# terminal history size 200
	```

* **Tips**

	* Désactiver la recherche DNS
	```
	(config)# no ip domain-lookup
	```