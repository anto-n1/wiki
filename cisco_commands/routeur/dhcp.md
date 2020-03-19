# DHCP routeurs

* **Configurer serveur DHCP**
	```
	(config)# ip dhcp excluded-address 10.10.10.10 10.10.10.100
	(config)# ip dhcp excluded-address 10.10.10.10
	(config)# ip dhcp pool LAN_name
	(config-dhcp)# network 10.10.10.192 2552.55.255.192
	(config-dhcp)# default-router 10.10.10.1
	(config-dhcp)# dns-server 192.168.10.2
	(config-dhcp)# domain-name <domaine>
	(config-dhcp)# lease 2 13 30
	```
	* **dhcp exclude** : exclure soit un pool soit une adresse seule  
	* **dhcp pool** : donner un nom au pool
	* **network** : définir la plage d'adresses IP à proposer aux clients
	* **default-router** : définir un routeur par défaut aux clients (possibilité d'en donner jusqu'à 8 séparées par des espaces)
	* **dns-server** donner un serveur DNS aux clients (facultatif)
	* **domaine-name** : spécifier un domaine, la commande ```netbios-name-server``` existe aussi pour netbios
	* **lease** : définir la durée du bail (2 jours, 13 heures, 30 minutes), ou alors ```infinite```

* **Désactiver serveur DHCP**
	```
	(config)# no service dhcp
	```

* **Activer DHCP**
	```
	(config)# service DHCP
	```
	L'activation du service n'a aucun effet si les paramètres ne sont pas configurés.