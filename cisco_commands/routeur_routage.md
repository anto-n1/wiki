# CCNA 2 - ROUTAGE ET COMMUTATION

### Commandes générales sur les routes

* **Afficher table routage**
	```
	# show ip route
	# show ip route static
	# show ipv6 route
	```

* **Afficher table de routage pour un réseau particulier**
	```
	# show ip route 192.168.1.0
	```

### Routes statiques

* **Configurer route statique IPV4**
	```
	(config)# ip route <network address> <network mask> {<next-hop-ip> | <exit-intf>}
	(config)# ip route 192.168.1.0 255.255.255.0 S0/0/0
	(config)# ip route 192.168.1.0 255.255.255.0 192.168.100.100
	(config)# ip route 192.168.1.0 255.255.255..0 S0/0/0 192.168.100.100
	```
	**exit-intf** : interface de sortie  
	**next-hop-ip** : adresse IP du prochain routeur  
	Possibilité de mettre une route complète en définissant l'interface de sortie et le next-hop

* **Configurer route statique IPV6**
	```
	(config)# ipv6 route <network address> <network mask> {<next-hop-ip> | <exit-intf>}
	(config)# ipv6 route 2001:0db8:acad:1::/64 S0/0/0
	(config)# ipv6 route 2001:0db8:acad:1::/64 2001:0db8:acad:3::/64
	```

* **Configurer route par défaut IPV4**
	```
	(config)# ip route 0.0.0.0 0.0.0.0 <interface>
	(config)# ip route 0.0.0.0 0.0.0.0 S0/0/0
	!OU
	(config)# ip route 0.0.0.0 0.0.0.0 <next-hop>
	(config)# ip route 0.0.0.0 0.0.0.0 192.168.10.1
	```
	Attention pas sécurisé, tout est autorisé.

* **Configurer route par défaut IPV6**
	```
	(config)# ipv6 route ::/0 <interface>
	(config)# ipv6 route ::/0 S0/0/1
	```
	Attention pas sécurisé, tout est autorisé.

### Routage dynamique

* **Afficher les protocoles de routage disponibles**
	```
	(config)# router ?
	(config)# ipv6 router ?
	```

* **Activer routage IPV6**
	```
	(config)# ipv6 unicast-routing
	```
	ATTENTION : ceci est INDISPENSABLE pour activer le routage IPV6.