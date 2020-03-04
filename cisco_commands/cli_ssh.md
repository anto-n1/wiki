# SSH


```
(config)# crypto key generate rsa modulus 1024
```

```
(config)# 
```


ip ssh time-out 60
ip ssh athentication-retries 2
ip domain-name cisco.com


username Admin privilege 1 password 7 08DSDDZDZ021

spanning-tree mode pvst
spanning-tree extend system-id

* Limiter nombre d'adresses IP et MAC sur un port
```
(config)# switchport port-security maximum 2
```
2 systems aux max sur le port -> 2 adresses MAC donc 2 IP, le port se coupe si une troisième IP : réouverture derrière manuelle


switchport port-security mac-address sticky