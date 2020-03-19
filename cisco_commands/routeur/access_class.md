# Access class routeurs

Access class permet limiter l'accès aux VTY.

* **Syntaxe**
	```
	(config-line)# access-class <access-list-number> {in [vrf-also] | out}
	```
	* **in** : limite les connexions entrantes entre les adresses de la liste d'accès et le périphérique Cisco

* **Exemple de limitation d'accès SSH**
	```
	(config)# line vty 0 4
	(config-line)# login local
	(config-line)# transport input ssh
	(config-line)# access-class 21 in
	(config-line)# exit
	(config)# access-list 21 permit 192.168.10.0 0.0.0.0.255
	(config)# access-list 21 deny any
	```