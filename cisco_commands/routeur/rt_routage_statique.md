# Routage statique

## Routes statiques

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
	(config)# ipv6 route <ipv6-prefix>/<prefix-length> {<ipv6-address> | <exit-intf>}
	(config)# ipv6 route 2001:0db8:acad:1::/64 S0/0/0
	(config)# ipv6 route 2001:0db8:acad:1::/64 2001:0db8:acad:3::/64
	```
	**ipv6-prefix** : adresse destination du réseau distant, à ajouter à table de routage
	**prefix-length** : longueur du préfixe du réseau distant à ajouter à table de routage
	**ipv6-address** : adresse IP du routeur de tronçon suivant
	**exit-intf** : interface de sortie pour transférer les paquets vers le réseau de destination

## Routes par défaut

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
	On donne soit l'interface de sortie, soit une adresse de sortie.

## Routes statiques flottantes

* **Configurer route statique flottante IPV4**
	```
	(config)# ip route 0.0.0.0 10.10.10.10 5
	```
	C'est la même chose que pour une route statique, on indique simplement une distance administrative à la fin (ici 5). Cette valeur est supérieure à la valeur par défaut de 1 ; par conséquent cette route flotte et n’est pas inscrite dans la table de routage, sauf si la route préférentielle échoue.  
	Cette route n'apparaît pas dans la table de routage tant que la route par défaut n'est pas tombée.

* **Configurer route statique flottante IPV6**
	```
	(config)# ipv6 route ::/0 2001:db8:acad:4::2 5
	```
	On indique également une distance administrative à la fin

* **Vérifier que la route statique flottante n'est pas dans la table de routage**
	```
	# show ip route static | begin S :
	# show ipv6 route static | begin S :
	```

* **Tester une route statique flottante**
	```
	(config)# int s0/0/0
	(config-if)# shut
	# show ip route static | begin Gateway
	# traceroute 192.168.1.1
	```
	On désactive l'interface par défaut, puis on vérifie que la route par défaut est celle définie en route statique flottante, et on test avec un traceroute.