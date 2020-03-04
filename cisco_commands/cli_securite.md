# Sécurisation switchs et routeurs

* **Limiter nombre d'adresses IP et MAC sur un port**
	```
	(config)# switchport port-security maximum 2
	```
	2 adresses MAC (donc 2 IP) maximum sur le port. Il se coupe si une troisième IP, puis réouverture manuelle obligatoire ensuite.


switchport port-security mac-address sticky

 switchport access vlan 30
 switchport mode access
 switchport port-security
 switchport port-security maximum 2
 switchport port-security mac-address sticky 
 switchport port-security violation restrict 
 switchport port-security mac-address sticky 0001.C90E.8923