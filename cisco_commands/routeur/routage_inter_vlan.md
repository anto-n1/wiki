# Routage inter-vlan

Avant de configurer le routage inter-vlan, il faut configurer celui-ci sur les switchs. C'est à dire attribuer des vlan aux interfaces des switchs.

## Routage inter-vlan existant

Il suffit simplement de mettre des adresses IP appartenant aux vlan sur chaque interface du routeur. Exemple pour router un vlan 10 arrivant sur l'interface g0/0 vers le vlan 30 arrivant sur g0/1 :

* **Configurer routage inter-vlan sur deux interfaces**
	```
	(config)# interface g0/0
	(config-if)# ip address 172.16.10.1 255.255.255.0
	(config-if)# no shutdown
	(config-if)# interface g0/1
	(config-if)# ip address 172.16.30.1 255.255.255.0
	(config-if)# no shutdown
	```

## Routage router-on-a-stick

* **Configurer router-on-a-stick sur une seule interface**
	```
	(config)# interface g0/0.10
	(config-subif)# ecapsulation dot1q 10
	(config-subif)# ip address 172.16.10.1 255.255.255.0
	(config-subif)# interface g0/0.30
	(config-subif)# ecapsulation dot1q 30
	(config-subif)# ip address 172.16.30.1 255.255.255.0
	(config-subif)# interface g0/0
	(config-if)# no shutdown
	```
	* **encapsulation** : avant de recevoir une IP, une sous interface doit être configurée pour un vlan, ici on définit deux sous interfaces de g0/0 pour les vlan 10 et 30.
	* **ip address** : définir des adresses IP correspondant aux vlans