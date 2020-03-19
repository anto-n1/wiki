# Access Lists routeurs

:warning: **Attention à bien positionner les ACL étendues au plus près de la source, et les standards près de la destination.**

## Wildcard - masque générique

Le calcul du wildcard se fait en effectuant la soustraction d'un maque 255.255.255.255 avec le masque du réseau concerné :

  255.255.255.255  
\- 255.255.255.192 ( pour un masque en /26 )  
-----------------  
=  0 . 0 . 0 . 63  
 
Autre exemple pour un masque en /19

  255.255.255.255  
\- 255.255.224. 0  
-----------------  
=  0 . 0 . 31. 255  

## Mots-clés any et host

* **Tout autoriser**
	```
	(config)# access-list 1 permit 0.0.0.0 255.255.255.255
	OU
	(congig)# access-list 1 permit any
	```
	any peut remplacer l'adresse IPv4 0.0.0.0, avec un masque générique 255.255.255.255. Possibilité d'utiliser aussi deny plutôt que permit. 

* **Permettre un hôte unique**
	```
	(config)# access-list 1 permit 192.168.10.10 0.0.0.0
	(config)# access-list 1 permit host 192.168.10.10
	```

## Syntaxe des ACL

* **Syntaxe d'une ACL**
	```
	(config)# access-list <access-list-number> {deny | permit | remark} <source> [masque-générique-source] [log]
	(config)# access-list 10 permit 192.168.10.0 0.0.0.255
	```
	* **access-list-number** : numéro d'ACL, nombre décimal compris entre 1 et 99 ou entre 1300 et 1999 pour les ACL standard
	* **deny-permit-remark** :
		* **deny** : refuser l'accès si les conditions sont respectées
		* **permit** : autoriser l'accès si les conditions sont respectées
		* **remark** : ajouter une remarque sur les entrées dans une liste de contrôle d'accès IP pour faciliter la compréhension de la recherche
	* **source** : numéro du réseau ou du commutateur à partir duquel le paquet est envoyé, soit un réseau ou any
	* **source-wildcard** : masque générique
	* **log** : déclencher un message journal informatif visible sur la commande. A voir avec ```logging console```

## Afficher les ACL

* **Afficher les ACL**
	```
	# show access-lists
	# show running-config | include access-list 10
	```

* **Vider les statistiques d'utilisation**
	```
	# clear access-list counters
	```

## ACL standard

* **Activer une ACL**
	```
	(config)# access-list 1 permit 192.168.10.0 0.0.0.255
	(config)# interface serial 0/0/0/
	(config-if)# ip access-group 1 out
	```
	Une fois qu’une liste de contrôle d’accès standard IPv4 est configurée, elle est associée à une interface à l’aide de la commande « ip access-group » en mode de configuration d'interface :  
	1. Créer une ACL
	2. Sélectionner une interface
	3. Activer l'ACL sur une interface (ici en filtre sortant)

* **Nommer des ACL**
	```
	(config)# ip access-list [standard  | extended] name
	(config-stf-nacl)# [permit | deny | remark] {source [source-wildcard]} [log]
	(config-if)# ip access-group <name> [in | out]
	```
	Ce sont des exemples d'ACL nommées.