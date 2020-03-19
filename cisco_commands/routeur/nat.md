# Routeur - NAT

## NAT statique

* **Configurer NAT statique**
	```
	(config)# ip nat inside source static 192.168.11.99 209.165.201.5
	(config)# interface serial 0/0/0
	(config-if)# ip address 192.168.1.2 255.255.255.252
	(config-if)# ip nat inside
	(config-if)# exit
	(config)# interface serial 0/0/1
	(config-if)# ip address 203.165.200.1 255.255.255.252
	(config-if)# ip nat outside
	```
	* **nat inside source static** : établir une traduction statique entre adresse interne et externe
	* **ip address 192.168.1.2** : identifier l'interface s0/0/0 en tant qu'interface NAT interne
	* **ip address 203.165.200.1** : identifier l'interface s0/0/1 en tant qu'interface NAT externe

## NAT dynamique

* **Configurer NAT dynamique**
	```
	(config)# ip nat pool NAT-POOL1 209.165.200.226 209.165.200.240 netmask 255.255.255.224
	(config)# access-list 1 permit 192.168.0.0 0.0.255.255
	(config)# ip nat inside source list 1 pool NAT-POOL1
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

## Affichage d'informations et vérification fonctionnement

* **Vérification des traductions NAT**
	```
	# show ip nat translations
	# show ip nat translations verbose
	# show ip nat statistics
	```

* **Effacer les statistiques NAT**
	```
	# clear ip nat statistics
	```

* **Vérifier fonctionnement**
	```
	# debug ip nat
	# debug ip nat detailed