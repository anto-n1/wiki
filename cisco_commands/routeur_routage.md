# CCNA 2 - ROUTAGE ET COMMUTATION

### Commandes générales sur les routes

* **Afficher les routes**
	```
	# show ip route
	# show ipv6 route
	```

### Routes statiques

* **Configurer route statique IPV4**
	```
	(config)# ip route *network mask {next-hop-ip | exit-intf}*
	(config)# ip route 192.168.1.0 255.255.255.0 S0/0/0
	(config)# ip route 192.168.1.0 255.255.255.0 192.168.100.100
	```

* **Configurer route statique IPV6**
	```
	(config)# ipv6 route *network mask {next-hop-ip | exit-intf}*
	(config)# ipv6 route 2001:0db8:acad:1::/64 S0/0/0
	(config)# ipv6 route 2001:0db8:acad:1::/64 2001:0db8:acad:3::/64
	```

* **Configurer route par défaut IPV4**
	```
	(config)# ip route 0.0.0.0 0.0.0.0 *interface*
	(config)# ip route 0.0.0.0 0.0.0.0 S0/0/0
	```
	Attention pas sécurisé, tout est autorisé.

* **Configurer route par défaut IPV6**
	```
	(config)# ipv6 route ::/0 *interface*
	(config)# ipv6 route ::/0 S0/0/1
	```
	Attention pas sécurisé, tout est autorisé.

### Routage dynamique