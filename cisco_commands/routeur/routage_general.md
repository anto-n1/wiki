# Commandes générales routage

* **Afficher table routage**
	```
	# show ip route
	# show ipv6 route 2001:db8:acad:3::
	# show running-config | section ipv6 route
	```

* **Afficher table de routage pour un réseau particulier**
	```
	# show ip route 192.168.1.0
	```

* **Afficher les routes statiques**
	```
	# show ip route static
	# show ipv6 route static
	```

* **Afficher les paramètres de protocole de routage IPV4**
	```
	# show ip protocols
	```

Différence entre table de routage IPv4 et IPv6 : par conception, IPv6 est sans classe et toutes les routes sont des meilleures routes de niveau 1.