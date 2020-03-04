# Routage dynamique routeurs

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

## Routage RIP

* **Activer routage protocole RIP**
	```
	(config)# router rip
	(config-router)# version 2
	(config-router)# passive-interface s0/0/0
	(config-router)# network 10.0.0.0
	(config-router)# default-information originate
	```

## Routage EIGRP

* **Activer EIGRP et définir les réseaux connectés**
	```
	(config)# router eigrp 1
	(config-router)# network 172.16.3.0 0.0.0.255
	```
	1 est le numéro de système autonome, parallèle avec les VLAN et ACL. Ce numéro est à choisir.  
	Attention à utiliser le wildcard lors de l'annonce des réseaux.

* **
