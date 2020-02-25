# CCNA 2 - ROUTAGE ET COMMUTATION

## Gestion d'un routeur

### Gestion des interfaces

* **Configurer interface IPV4**
	```
	(config)# interface GigabitEthernet 0/0
	(config-if)# description Lien vers Lan 1
	(config-ig)# ip address 192.168.1.1 255.255.255.0
	(config-if)# no shutdown
	(config-if)# exit
	```

* **Configurer interface IPV6**
	```
	(config)# interface GigabitEthernet 0/0
	(config-if)# description Lien vers Lan 1
	(config-ig)# ipv6 address 2001:db8:acad:1::1/64
	(config-if)# no shutdown
	(config-if)# exit
	```