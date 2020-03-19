# Serveurs relais routeurs

Les routeurs Cisco sont capables de servir de serveurs relais pour plusieurs services :

| Service                        | Port |
|--------------------------------|------|
| NTP                            | 37   |
| TACACS                         | 49   |
| DNS                            | 53   |
| Serveur BOOTP/DHCP             | 67   |
| Client BOOTP/DHCP              | 68   |
| TFTP                           | 69   |
| Service de noms NetBIOS        | 137  |
| Service de datagrammes NetBIOS | 138  |

## Relais DHCP

* **Configurer relais DHCPv4**
	```
	(config)# interface g0/0
	(config-if)# ip helper-address 192.168.11.6
	```
	L'adresse IP est celle du serveur DHCP

* **Configurer relais DHCPv6**
	```
	(config)# interface g0/0
	(config-if)# ipv6 dhcp relay destination 2001:DB8:CAFE:1::/64
	```
	L'adresse IP est celle du serveur DHCP

* **Vérifier qu'une interface est en mode relai**
	```
	# show ipv6 dhcp interface g0/0
	```