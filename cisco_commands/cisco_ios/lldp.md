# LLDP - Link Layer Discovery Protocol

* **Activer/Désactiver LLDP de manière globale**
	```
	(config)# lldp run
	(config)# no lldp run
	```

* **Configurer LLDP sur une interface**
 	```
 	(config)# interface gigabitethernet 0/0
	(config-if)# lldp transmit
	(config-if)# lldp receive
	```

 **Afficher infos LLDP**
 	```
 	# show lldp
 	# show lldp neighbors
 	# show lldp neighbors detail
 	```