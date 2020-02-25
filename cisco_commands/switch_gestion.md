# CCNA 2 - ROUTAGE ET COMMUTATION

## Gestion d'un switch

* **Configurer interface de gestion**
	```
	(config)# interface vlan 1
	(config-ig)# ip address 192.168.1.1 255.255.255.0
	(config-if)# no shutdown
	(config-if)# exit
	(config)# ip default-gateway 192.168.1.254
	```
	Définir la gateway par défaut pour sortir du réseau