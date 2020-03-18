# Switch et VLAN

* **Afficher les vlan**
	```
	# show vlan brief
	# show vlan
	```

* **Créer un vlan**
	```
	(config)# vlan 10
	(config)# name monvlan
	```

* **Faire passer un vlan sur une interface**
	```
	(config)# interface FastEthernet 0/1
	(config-if)# switchport access vlan 10
	```

* **Configurer un trunk sur une interface**
	```
	(config)# interface GigabitEthernet 0/2
	(config-if)# switchport mode trunk
	```