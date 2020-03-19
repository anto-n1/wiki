# DHCP V6 routeurs

## SLAAC

Le routage IPv6 doit être activé avant : ```ipv6 unicast-routing```

SLAAC est l'option par défaut sur les routeurs Cisco. Les indicateurs M et O sont tous deux définis sur 0 dans l'annonce de routeur, comme illustré sur la figure.

Les messages RA sont configurés sur une interface d'un routeur. Pour réactiver l'option SLAAC sur une interface qui a été définie sur une autre option, les indicateurs M et O doivent être réinitialisés (reprendre leurs valeurs initiales de 0). Les commandes suivantes du mode de configuration d'interface permettent d'y parvenir :
```
(config-if)# non ipv6 nd managed-config-flag
(config-if)# no ipv6 nd other-config-flag
```

## Serveur DHCPv6

* **Serveur DHCPv6 sans état**
	```
	(config)# ipv6 unicast-routing
	(config)# ipv6 dhcp pool <IPV6-STATELESS>
	(config-dhcpv6)# dns-server 2001:db8:cafe:aaaa::5
	(config-dhcpv6)# domain-name mondomain.fr
	(config-dhcpv6)# exit
	(config)# interface g0/0
	(config-if)# ipv6 address 2001:db8:cafe:1::1/64
	(config-if)# ipv6 dhcp server <IPV6-STATELESS>
	(config-if)# ipv6 nd other-config-flag
	```

* **Vérification serveur DHCP sans état**
	```
	# show ipv6 dhcp pool
	```

* **Serveur DHCPv6 avec état**
	```
	(config)# ipv6 unicast-routing
	(config)# ipv6 dhcp pool <IPV6-STATELESS>
	(config-dhcpv6)# dns-server 2001:db8:cafe:aaaa::5
	(config-dhcpv6)# domain-name mondomain.fr
	(config-dhcpv6)# exit
	(config)# interface g0/0
	(config-if)# ipv6 address 2001:db8:cafe:1::1/64
	(config-if)# ipv6 dhcp server <IPV6-STATELESS>
	(config-if)# ipv6 nd managed-config-flag
	```
	Changer uniquement la dernière commande par rapport au serveur sans état.

## Client DHCPv6

* **Client DHCPv6 sans état** : le client envoie un message DEMANDE D'INFORMATIONS DHCPv6 au serveur DHCPv6 demandant uniquement les paramètres de configuration, tels que l'adresse du serveur DNS. Le client a généré sa propre adresse IPv6 à l'aide du préfixe indiqué dans le message AR et d'un ID d'interface aléatoire.

* **Client DHCPv6 avec état** : le client envoie un message REQUÊTE DHCPv6 au serveur pour obtenir du serveur une adresse IPv6 et tous les autres paramètres de configuration.

### DHCP sans état

* **Client DHCPv6 sans état**
	```
	(config)# interface g0/0
	(config-if)# ipv6 enable
	(config-if)# ipv6 address autoconfig
	```
	* **ipv6 enable** : activer une adresse de link-local
	* **address autoconfig** : active la configuration SLAAC

* **Vérification client DHCP sans état**
	```
	# show ipv6 interface g0/0
	# debug ipv6 dhcp detail
	```

### DHCP avec état

* **Client DHCPv6 avec état**
	```
	(config)# interface g0/0
	(config-if)# ipv6 enable
	(config-if)# ipv6 address dhcp
	```
	* **ipv6 enable** : activer une adresse de link-local
	* **address dhcp** : demander adresse à serveur DHCP

* **Vérification client DHCP avec état**
	```
	# show ipv6 interface g0/0
	# show ipv6 dhcp binding
	# debug ipv6 dhcp detail
	```
	**dhcp binding** : affiche la liaison automatique entre l'adresse link-local du client et l'adresse attribuée par le serveur