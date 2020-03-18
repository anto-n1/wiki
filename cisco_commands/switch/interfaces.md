# Gestion interfaces switch

* **Configurer interface de gestion***
	```
	(config)# interface vlan 1
	(config-ig)# ip address 192.168.1.1 255.255.255.0
	(config-if)# no shutdown
	(config-if)# end
	```

	1. **interface vlan** : passer en mode de configuration d'interface pour SVI (peut être n'importe quel VLAN ou simple interface) - attention le vlan doit exister
	2. **ip address** : définir une adresse IP sur laquelle le switch sera accessible
	3. **no shutdown** : activer l'interface
	
* **Configurer une passerelle par défaut**
	```
	(config)# ip default-gateway 192.168.1.254
	```
	Définir la gateway par défaut pour sortir du réseau et surtout accéder au switch depuis l'extérieur

* **Afficher l'état des interfaces***
	```
	# show interfaces status
	```

* **Afficher informations sur un port**
	```
	# show interface FastEthernet 0/1
	```

* **Afficher paramètres de sécurité des ports**
	```
	# show port-security
	```

* **Afficher les IP sur interfaces**
	```
	# show ip interface brief
	```