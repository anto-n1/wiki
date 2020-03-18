# Routage dynamique

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

## Routage EIGRP

* **Activer EIGRP et définir les réseaux connectés en IPV4**
	```
	(config)# router eigrp 1
	(config-router)# network 172.16.3.0 0.0.0.255
	(config-router)# passive-interface default
	(config-router)# no passive-interface s0/0/1
	(config-router)# redistribute static
	(config-router)# exit
	(config)# interface FastEthernet 0/1
	(config-if)# ip hello-interval eigrp 1 10
	```
	router eigrp : 1 est le numéro de système autonome, parallèle avec les VLAN et ACL. Ce numéro est à choisir.  
	network : attention à utiliser le wildcard lors de l'annonce des réseaux.
	passive-interface : envoyer requête EIGRP sur aucune interface
	no passive-interface : envoyer requête EIGRP uniquement sur cette interface.
	redistribute static : propager les routes statiques en EIGRP
	hello-interval : temps entre chaque discussions EIGRP. Le 1 représente le numéro de l'EIGRP défini à la première commande.

* **Activer EIGRP avec IPV6**
	```
	(config)# ipv6 route ::/0 s0/0/0
	(config-rtr)# ipv6 unicast-routing
	(config-rtr)# ipv6 router eigrp 1
	(config-rtr)# eigrp router-id 1.1.1.1
	(config-rtr)# redistribute static
	(config-rtr)# passive-interface default
	```
	ipv6 route : route par défaut
	router-id : aucun rapport avec adresse IP, c'est juste un ID

## Routage OSPF

* **Activer OSPF et définir les réseaux connectés en IPV4**
	```
	(config)# router ospf 10
	(config-router)# router-id 1.1.1.1
	(config-router)# network 172.16.1.1 0.0.0.255 area 0
	(config-router)# network 172.16.2.1 0.0.0.255 area 0
	(config-router)# passive-interface GigabiEthernet 0/0
	```
	router ospf : activer OSPF et lui donner un numéro (il doit être égal sur les autres routeurs à côté).
	router-id : donner un ID, on peut donner l'ip du routeur
	network : définir un réseau et son wildcard à partager en OSPF. L'area est la zone.
	passive-inteface : eviter de polluer le réseau en envoyant de l'OSPF sur des liens qui ne vont pas vers des routeurs

* **Activer OSPF et définir les réseaux connectés en IPV6**
	```
	(config)# ipv6 router ospf 10
	```

* **Effacer et arrêter OSPF**
	```
	# clear ip ospf process
	```

* **Afficher les voisins ESPF**
	```
	# show ip ospf neighbor
	# show ipv6 ospf neighbor
	```