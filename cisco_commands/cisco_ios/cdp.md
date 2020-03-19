# CDP - Cisco Discovery Protocol

* **Afficher infos CDP**
	```
	# show cdp
	# show cdp neighbors
	# show cpd neighbors detail
	# show cdp interfaces
	```

* **Activer CDP sur une interface**
	```
	(config)# interface FastEthernet 01
	(config-if)# cdp enable
	```

* **Activer/Désactiver CDP globalement**
	```
	(config)# cdp run
	(config)# no cdp run
	```