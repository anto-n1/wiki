# DHCP routeurs

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

* 
```
(config)# 
```

* 
```
(config)# 
```

* **DHCP exclure adresses**
	```
	(config)# ip dhcp excluded-address 10.10.10.10 10.10.10.100
	(config)# ip dhcp excluded-address 10.10.10.10
	```

* **Créer pool DHCP**
	```
	(config)# DHCP pool LAN_name
	```

* 
```
(config-dhcp)# network 10.10.10.192 2552.55.255.192
```

ip dhcp pool LAN
 network 10.10.10.192 255.255.255.192
 default-router 10.10.10.193