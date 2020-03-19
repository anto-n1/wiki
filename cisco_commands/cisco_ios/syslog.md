# SYSLOG

* **Ajouter horodatage message syslog**
	```
	(config)# service timestamps log datetime
	```
	Forcer les événements journalisés à afficher la date et l'heure.

* **Journalisation par défaut**
	```
	# logging console
	# logging buffered
	```
	Par défaut, les routeurs et commutateurs Cisco envoient des messages journaux à la console pour tous les niveaux de gravité. Sur certaines versions de Cisco IOS, le périphérique consigne également les messages dans une mémoire tampon par défaut. Les deux commandes activent ces deux paramètres.

* **Afficher les paramètres de journalisation**
	```
	# show logging
	# show logging | begin June 12 22:35
	# show logging | include changed state to up
	```

* **Configurer syslog**
	```
	(config)# logging 192.168.1.3
	(config)# logging trap 4
	(config)# logging source-interface g0/0
	(config)# interface loopback 0
	```
	* **logging 192.168.1.3** : adresse IP ou nom du serveur syslog vers lequel envoyer les logs
	* **logging trap 4** : choisir le niveau de log (ici 4)
	* **logging source-interface** : spécifier que les paquets Syslog contiennent les adresses IPv4 ou IPv6 d'une interface spécifique, quelle que soit l'interface utilisée par le paquet pour quitter le routeur.