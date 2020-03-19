# Switch et vlan

## Afficher les vlan

* **Afficher les vlan**
	```
	# show vlan brief
	# show vlan id 10
	# show vlan name monvlan
	# show vlan summary
	```
	* **summary** affiche un résumé (ou synthère) sur les vlan

* **Aficher les vlan des interfaces**
	```
	# show interfaces vlan 10
	# show interfaces switchport
	# show interfaces fastethernet 0/1 switchport
	```
	* **switchport** affiche l'état administratif et opérationnel d'un port, y compris les paramètres de blocage et de protection du port

## Création et suppression

* **Créer un vlan**
	```
	(config)# vlan 10
	(config)# name monvlan
	```
	Possibilité de créer plusieurs vlan d'un coup avec ```(config)# vlan 100 102 105-107```

* **Supprimer un vlan**
	```
	(config)# no vlan 10
	```
	**Attention** : Avant de supprimer un vlan, réaffecter tous les ports membres à un autre vlan. Tous les ports qui ne sont pas déplacés vers un vlan actif ne pourront plus communiquer avec d’autres hôtes une fois le vlan supprimé et tant qu’ils ne seront pas attribués à un vlan actif.

* **Supprimer tous les vlan**
	```
	# delete flash:vlan.dat
	```
	Cela rétabli les paramètres de vlan par défaut.

## Attribution des vlan aux interfaces

* **Faire passer un vlan sur une interface**
	```
	(config)# interface FastEthernet 0/1
	(config-if)# switchport mode access
	(config-if)# switchport access vlan 10
	(config-if)# end
	```
	La commande ```switchport access vlan``` force la création d'un vlan.

* **Faire passer TOUS les vlan du switch sur une interface**
	```
	(config)# interface f0/5
	(config-if)# switchport mode trunk
	```

* **Supprimer l'attribution d'un vlan**
	```
	(config)# interface FastEthernet 0/1
	(config-if)# no switchport access vlan
	(config-if)# end
	```

* **Configurer un trunk sur une interface**
	```
	(config)# interface GigabitEthernet 0/2
	(config-if)# switchport mode trunk
	(config-if)# switchport trunk native vlan 10
	(config-if)# swicthport trunk allowed vlan 10 20 30
	```
	* **switchport mode trunk** : passer l'interface en trunk
	* **switchport trunk native vlan** : spécifier un vlan pour les trames non étiquetées
	* **switchport trunk allowed** :  indiquer la liste des vlan autorisés sur la liaison trunk

## Réinitialisation des valeurs configurées sur liaisons trunk

* **Réinitialiser liaison trunk sur interface**
	```
	(config)# interface GigabitEthernet 0/2
	(config-if)# no switchport trunk allowed vlan
	(config-if)# no swicthport trunk native vlan
	```
	* **no switchport trunk allowed** : définir trunk de sorte qu'il autorise tous les vlan
	* **no switchport trunk native vlan** : redéfini le vlan natif sur les paramètres par défaut