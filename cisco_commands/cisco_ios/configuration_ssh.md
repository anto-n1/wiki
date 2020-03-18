# Configurer SSH switchs et routeurs

* **Configurer SSH et mot de passe utilisateur**
	```
	(config)# ip domain-name cisco.com
	(config)# crypto key generate rsa
	(config)# username admin secret <monpassword>
	(config)# line vty 0 4
	(config-line)# login local
	(config-line)# transport input ssh
	(config-line)# exit
	(config)# ip ssh version 2
	(config)# ip ssh authentication-retries 2
	(config)# ip ssh time-out 120
	```
	Les étapes sont les suivantes :
	* **domaine-name** : donner un nom DNS à l'équipement
	* **crypto** : générer une clé RSA de 1024 bits
	* **unsername admin** : créer utilisateur admin et lui donner un mot de passe
	* **line vty 0 4** : autoriser 5 (0 à 4) connexion simultanées (seulement 0 pour une seule)
	* **login local** : utiliser le user et mdp défini au dessus pour se connecter en SSH
	* **transport input ssh** : accepter que SSH (pas telnet)
	* **ip ssh version 2** : utiliser la version 2 de SSH (la 1 a des vulnérabilités connues)
	* **authentication-retries** : définir le nombre d'essai avant d'authent
	* **time-out** : mettre un timeout