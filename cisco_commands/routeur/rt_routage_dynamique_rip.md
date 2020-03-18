# Routage dynamique protocole RIP

* **Afficher les options disponibles pour le protocole RIP**
	```
	# router rip
	(config-router)# ?
	```

* **Activer routage protocole RIP**
	```
	(config)# router rip
	(config-router)# version 2
	(config-router)# network 10.0.0.0
	(config-router)# network 172.16.0.0
	(config-router)# passive-interface s0/0/0
	(config-router)# default-information originate
	(config-router)# end
	```
	1. **router rip** : activer le protocole de routage RIP

	2. **version 2** : utiliser la version 2 du protocole (si non précisé, V1 par défaut)

	3. **network 10.0.0.0** : annoncer le/les réseaux que le routeur va devoir échanger avec les autres. Ces interfaces recoivent et envoient des paquets RIP

	4. Idem que le point 3
	
	5. **passive-interface** : par défaut, les MAJ sont envoyées sur toutes les interfaces. Pour économiser bande passante et sécuriser, on coupe les MAJ sur les interfaces qui n'ont pas besoin de routage dynamique.
	
	6. **default-information originate** : propager la route par défaut (défini avec ```ip route 0.0.0.0 0.0.0.0```) dans les MAJ RIP pour informer les autres routeurs.

* **Mettre toutes les interfaces en passive par défaut**
	```
	(config-router)# passive-interface default
	(config-router)# no passive-interface s0/0/0
	```
	Mettre tout en passif par défaut puis autoriser seulement certaines interfaces.

* **Désactivé le résumé automatique (RIPv2 uniquement)**
	```
	(config-router)# no auto-summary
	```
	Permet de ne plus résumer les réseaux dans leur adresse par classe au niveau des routeurs de périphérie. La commande ```show ip protocols``` indique ensuite que la récapitulation des réseaux automatiques n'est pas en vigueur.

* **Activer uniquement RIPv1**
	```
	(config-router)# version1
	```

* **Restaurer RIP par défaut (v1 mais écoute aussi v2)**
	```
	(config-router)# no version
	```
	Définit le routeur sur le paramètre par défaut qui consiste à envoyer des mises à jour de la version 1, mais à écouter des mises à jour de la version 1 et de la version 2.

* **Désactiver routage RIP**
	```
	(config)# no router rip
	```