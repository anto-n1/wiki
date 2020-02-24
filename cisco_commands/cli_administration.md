# Commandes d'administration d'IOS

Ce fichier présente les commandes de base à connaître pour administrer des routeurs et switchs Cisco.

* **Nom d'hôte**
	
	* Ajouter un nom d'hôte :
	```
	# conf t
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

	* Mettre un mot de passe :
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
	(config)# password <monpassword>
	(config)# login
	```
	'0 5' pour autoriser 5 connexions simultanées.

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