# CCNA 2 - ROUTAGE ET COMMUTATION

## Routes statiques

* **Configurer route statique**
```
ip route <network address> <subnet mask> {ip address} {exit-intf}
```
	* exit-intf : adresse de l'interface du routeur sur lequel je suis connecté
	* ip address :  

* **Configurer route par défaut**
```
ip route 0.0.0.0 0.0.0.0 <interface>
ip route 0.0.0.0 0.0.0.0 S0/0/0
```