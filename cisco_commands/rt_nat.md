# CCNA 2 - ROUTAGE ET COMMUTATION

## Routeur - NAT - PAT

* **Configurer NAT**
	```
	(config)# interface serial s0/0/0
	(config-if)# ip address 10.10.10.10 255.255.255.0
	(config-if)# ip nat inside
	```
	Il faut configurer une adresse sur l'interface en amont

* 
```
(config)# ip nat pool NAT_name 193.133.219.128 192.133.219.129 netmask 255.255.255.252
(config)# ip nat inside source list 1 pool NAT_name overload
(config)# ip nat inside source static 10.10.10.162 198.133.219.130
```

* 
```
(config)# 
```

* 
```
(config)# 
```

* 
```
(config)# 
```