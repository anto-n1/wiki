# DHCP V4 routeurs

## Serveur DHCP

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

## Affichage d'informations

* **Activer DHCP**
	```
	(config)# service dhcp
	```
	L'activation du service n'a aucun effet si les paramètres ne sont pas configurés.

* **Afficher infos service DHCP**
	```
	# show running-config | section dhcp
	# show ip dhcp binding
	# show ip dhcp server statistics
	```

## Relais DHCP

Un routeur peut aussi relayer du DHCP.  
Cela est détaillé dans le fichier **serveurs_relais.md**.

## Client DHCP

Un routeur peut être un client DHCP sur certaines interfaces. Cela peut être utile dans les petites structures ou alors si l'adresse IP externe du routeur est fournie par un FAI.

* **Interface cliente DHCP**
	```
	(config)# interface g0/0
	(config-if)# ip address dhcp
	```

## Dépannage DHCP

En cas de problème DHCP, effectuer les vérifications suivantes :

1. Résoudre les conflits d'adresse
2. Vérifier la connectivité physique
3. Tester avec une IP statique
4. Vérifier configuration du port du commutateur
5. Vérifier à partir du même sous-réseau ou vlan

* **Résoudre conflit d'adresse**
	```
	# show ip dhcp conflict
	```

* **Résoudre problème de fonctionnement DHCP**
	```
	(config)# debug ip dhcp server events
	```

* **Autoriser DHCP sur les ACL**
	```
	(config)# access-list 100 permit udp any any eq 67
	(config)# access-list 100 permit udp any any eq 68
	# debug ip packet 100
	```
	**debug ip packet 100** permet d'afficher uniquement les messages DHCP dans ce cas là.