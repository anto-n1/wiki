# Dépannage routage

## Raisons des problèmes de connectivité

Les raisons princiaples qui font que les périphériques ne communiquent plus correctements sont les suivantes :
* interface désactivée
* fournisseur de service perd une connexion
* liaisons saturées
* configuration erronée

## Commandes standards

Les commandes standard de dépannage d'IOS sont nottament :
* ```# ping```
* ```# traceroute```
* ```# show ip route```
* ```# show ip route | begin Gateway```
* ```# show ip interface brief```
* ```# show cdp neighbors detail```
* ```# show running-config | section ip route```

## Commandes avancées

* **Ping depuis une interface précisée**
	```
	# ping 192.168.1.1 source g0/0
	```