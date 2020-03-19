# PAT - Port Address Translation

## PAT avec pool d'adresses

* **Configurer PAT avec pool d'adresses**
	```
	(config)# ip nat pool NAT-POOL1 209.165.200.226 209.165.200.240 netmask 255.255.255.224
	(config)# access-list 1 permit 192.168.0.0 0.0.255.255
	(config)# ip nat inside source list 1 pool NAT-POOL1 overload
	(config)# interface serial 0/0/0
	(config-if)# ip nat inside
	(config)# interface serial 0/0/1
	(config-if)# ip nat outside
	```
	* **ip nat pool nom start-ip end-ip netmask netmask** : définir un pool d'adresses globales à utiliser pour la traduction
	* **access-list** : définir une ACL autorisant les adresses qui doivent être traduites
	* **ip nat inside souce** : établir la traduction de source dynamique en spécifiant la liste d'accès et le pool définis lors des étapes précédentes
	* **ip nat inside** : identifier l'interface interne
	* **ip nat outside** : identifier l'interface externe

## PAT avec adresse unique

* **Configurer PAT avec adresse unique**
	```
	(config)# ip nat inside source list 1 interface serial 0/1/0 overload
	(config)# access-list 1 permit 192.168.0.0 0.0.255.255
	(config)# interface serial 0/0/0
	(config-if)# ip nat inside
	(config)# interface serial 0/1/0
	(config-if)# ip nat outside
	```
	* **ip nat inside source list** : identifier l'interface s0/1/0 externe comme étant l'adresse globale interne à surcharger via l'ACL 1
	* **access-list** : configurer l'ACL 1 de sorte qu'elle permette la traduction NAT des périphériques du réseau 192.168.0.0/16
	* **ip nat inside** : configurer l'interface NAT interne appropriée
	* **ip nat outside** : configurer l'interface NAT externe appropriée

## Affichage d'informations

Ce sont les mêmes commandes que pour le NAT.

## Transfert de port

* **Configurer transfert de port**
	```
	(config)# ip nat inside source static tcp 192.168.10.256 80 209.165.200.225 8080
	(config)# interface serial 0/0/0
	(config-if)# ip nat inside
	(config)# interface serial 0/1/0
	(config-if)# ip nat outside
	```
	* **ip nat inside source static** : établir traduction statique entre adresse locale interne et un port local, et entre une adresse globale interne et un port global