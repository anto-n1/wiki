# Sécurisation switchs et routeurs

* **Afficher la protection des ports**
	```
	# show port-security
	# show port-security address
	# show port-security interface fastEhernet 0/1
	```
	* Infos générales
	* Afficher adresses MAC autorisées sur chacun des ports
	* Afficher la sécurité d'une interface

* **Limiter nombre d'adresses IP et MAC sur un port**
	```
	(config)# switchport port-security maximum 2
	```
	2 adresses MAC (donc 2 IP) maximum sur le port. Il se coupe si une troisième IP, puis réouverture manuelle obligatoire ensuite.

* **Sécurisation manuelle d'un port**
	```
	(config)# interface fastEhernet 0/1
	(config-if)# switchport mode access
	(config-if)# switchport port-security
	(config-if)# switchport port-security mac-address 0001.C90E.8923
	```
	Possibilité d'utiliser un vlan plutôt qu'une interface

* **Sécurisation automatique d'un port**
	```
	(config)# interface fastEhernet 0/1
	(config-if)# switchport mode access
	(config-if)# switchport port-security
	(config-if)# switchport port-security mac-address sticky
	```

* **Configurer réaction lors de violation de sécurité**
	```
	(config)# interface fastEhernet 0/1
	(config-if)# switchport port-security violation <nom_methode>
	```
	Les méthodes sont : 
	* restrict : toutes les trames ayant des MAC sources inconnues sont bloquées
	* protect : alerte SNMP envoyée et compteur de violation incrémenté