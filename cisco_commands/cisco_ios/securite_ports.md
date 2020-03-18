# Sécurisation des ports de switchs et routeurs

## Informations de sécurité des ports

* **Afficher la protection des ports**
	```
	# show port-security
	# show port-security address
	# show port-security interface fastEhernet 0/1
	```
	* Infos générales
	* Afficher adresses MAC autorisées sur chacun des ports
	* Afficher la sécurité d'une interface

## Sécurité des MAC adresses

3 types d'adresses MAC sécurisées :

* **Adresses MAC sécurisées statiques** : les adresses MAC configurées de cette manière sont stockées dans la table d’adresses et sont ajoutées à la configuration en cours sur le commutateur.
* **Adresses MAC sécurisées dynamiques** : adresses MAC apprises de manière dynamique et stockées uniquement dans la table d'adresses. Les adresses MAC configurées ainsi sont supprimées au redémarrage du commutateur.
* **Adresses MAC sécurisées rémanentes** : adresses MAC pouvant être apprises de manière dynamique ou configurées manuellement, puis stockées dans la table d'adresses et ajoutées à la configuration en cours.

La commande ```switchport port-security``` permet d'activer la sécurité sur les ports, elle est indispensable avant d'exécuter les commandes qui les suivent.

* **Limiter nombre d'adresses IP et MAC sur un port**
	```
	(config)# interface fastEhernet 0/1
	(config-if)# switchport mode access
	(config-if)# switchport port-security
	(config-if)# switchport port-security maximum 2
	```
	2 adresses MAC (donc 2 IP) maximum sur le port. Il se coupe si une troisième IP, puis réouverture manuelle obligatoire ensuite.

* **Sécurisation manuelle et rémanente d'un port**
	```
	(config)# interface fastEhernet 0/1
	(config-if)# switchport mode access
	(config-if)# switchport port-security
	(config-if)# switchport port-security mac-address 0001.C90E.8923
	```
	Possibilité d'utiliser un vlan plutôt qu'une interface

* **Sécurisation automatique et rémanent d'un port**
	```
	(config)# interface fastEhernet 0/1
	(config-if)# switchport mode access
	(config-if)# switchport port-security
	(config-if)# switchport port-security mac-address sticky
	```

## Modes de violation

3 modes de violations :

* **Protect** : lorsque le nombre d'adresses MAC sécurisées atteint la limite autorisée sur le port, les paquets munis d'adresses sources inconnues sont ignorés jusqu'à ce qu'un nombre suffisant d'adresses MAC sécurisées soit supprimé ou que le nombre maximal d'adresses à autoriser soit augmenté. Aucune notification n'indique qu'une violation de sécurité s'est produite.

* **Restrict** : lorsque le nombre d'adresses MAC sécurisées atteint la limite autorisée sur le port, les paquets munis d'adresses sources inconnues sont ignorés jusqu'à ce qu'un nombre suffisant d'adresses MAC sécurisées soit supprimé ou que le nombre maximal d'adresses à autoriser soit augmenté. Dans ce mode, une notification indique qu'une violation de sécurité s'est produite.

* **Shutdown** : dans ce mode (le mode par défaut), toute violation de sécurité de port entraîne immédiatement la désactivation de l’enregistrement des erreurs dans l’interface et celle de la LED du port. Dans ce mode, le compteur de violation est incrémenté. Lorsqu’un port sécurisé est placé dans l’état de désactivation des erreurs.

Tableau récapitulatif de si la sécurité du port est violée :

| Mode de violation | Acheminement trafic | Envoie message syslog | Affichage message erreur | Incrémentation compteur violation | Arrêt port |
|-------------------|---------------------|-----------------------|--------------------------|-----------------------------------|------------|
| Protect           | Non                 | Non                   | Non                      | Non                               | Non        |
| Restrict          | Non                 | Oui                   | Non                      | Oui                               | Non        |
| Shutdown          | Non                 | Non                   | Non                      | Oui                               | Oui        |

* **Configurer réaction lors de violation de sécurité**
	```
	(config)# interface fastEhernet 0/1
	(config-if)# switchport port-security violation <nom_mode>
	```

## Désactivation de ports

* **Désactiver les ports non utilisés**
	```
	(config)# interface fastethernet 0/1
	(config-if)# shutdown
	OU
	(config)# interface range fastethernet 0/1 - 22
	```