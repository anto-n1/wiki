# Gestion interfaces des routeurs

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

* **Configurer interface loopback**
	```
	(config)# interface loopback 0
	(config-if)# ip address 10.0.0.1 255.255.255.0
	(config-if)# exit
	```
	C'est une interface virtuelle/logicielle qui est toujours up.  
	En activant cette interface, le routeur	l'utilise pour l'OSPF par exemple car elle toujours active, plutot qu'une adresse IP attribuée à un port qui peut tomber en panne.  

	Possibilité de choisir plusieurs numéros d'interfaces de loopback.

* **Vérifier ses interfaces IPV4**
	```
	# show ip interface brief
	# show ip route
	# show running-config interface FastEthernet 0/1
	# show interfaces
	```
	**interface brief** affiche un résumé de toutes les interfaces.  

	**ip route** affiche le conteneur de la table de routage. C = connecté / L = local

	**runnin-config interfaces** affiche les commandes actuelles configurées sur l'interface spécifiée.

	**show interfaces** affiche les informations sur l'interface et le nombre de flux de paquets sur toutes les interfaces.

* **Vérifier ses interfaces IPV6**
	```
	# show ipv6 interface brief
	# show ipv6 route
	```