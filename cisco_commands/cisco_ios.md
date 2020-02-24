# OS CISCO - IOS

ISO est le système d'exploitation des équipements Cisco.  

### Méthodes d'accès à IOS :
* Console
* SSH / Telnet
* Auxiliaire / Console

### Modes d'exécution principaux

* **Utilisateur** :  
	Nombre limité de commandes - mode de visualisation
* **Privilégié** :  
	Accès à toutes les commandes - équivalent root Linux

### Modes de configuration

* **Configuration globale** :  
	Affecte le fonctionnement de l'équipement dans son ensemble
	```
	# configuration terminal
	(config)# 
	```  

* **Configuration de ligne** :  
	Configuration de l'accès SSH, Telnet, Console
	```
	# configuration terminal
	(config-line)#
	```

* **Configuration d'interface** :  
	Configuration des interfaces
	```
	# conf t
	(config-if)#
	```

### Noms d'hôtes

* Commencent par une lettre
* Moins de 64 caractères
* Ne comportent pas d'espaces

### Fichiers de configuration

* **startup-config** :  
	Stocké en NVRAM. Ne perd pas son contenu après extinction. Contient les commandes à exécuter au démarrage.

* **running-config** :  
	Stocké en RAM. Reflète la conf en cours. Perds son contenu après extinction.