# NTP - Network Time Protocol

* **Configurer l'heure d'un équipement**
	```
	# clock set 20:36:00 dec 11 2020
	```

* **Se caler sur un serveur NTP**	
	```
	(config)# ntp server 209.165.200.225
	```
	
* **Vérification du protocole NTP**
	```
	# show ntp status
	# show ntp associations
	# show clock detail
	# show clock
	```