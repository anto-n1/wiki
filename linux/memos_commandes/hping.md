# Hping

Cette page présente des exemples de commandes hping.  
[Hping](http://hping.org) permet de scanner des réseaux, hôtes et forger des paquets et supporte ICMP, TCP, UDP, raw-IP.

#### Arguments de hping

* **-1** ou **--ICMP** : faire un ICMP
* **-p** : port cible
* **-A** ou **--ack** : flag ACK
* **-2** ou **--udp** : UDP
* **-Q** : collecter les numéros de séquence TCP générés par l'hôte cible
* **-S** ou **--syn** : port source
* **-8** ou **--scan** : scan de port
* **-V** ou **--verbose** : verbeux
* **-I** : spécifier une interface réseau
* **--rand-dest** : envoie des ICMP de manière aléatoire aux hôtes du réseau
* **-9** ou **--listen-signature** : écouter et intercepter si la signature du paquet correspond 
* **-a** ou **--spoof-hostname** : flood IP
* **--flood** : envoyer le maximum de paquets possibles

#### Exemples de commandes

* Simple ping
```
$ hping3 -1 10.0.0.25
```

* Scan ACK sur le port 80
```
$ hping3 -A 10.0.0.25 -p 80
```

* Scan UDP sur le port 80
```
$ hping3 -2 10.0.0.25 -p 80
```

* Collecter le numéro de séquence initial
```
$ hping3 10.0.0.25 -Q -p 139
```

* Scan SYN sur les ports 50 à 60
```
$ hping3 -8 50-60 -S 10.0.0.25 -V
```

* Scanner un réseau complet
```
$ hping3 -1 10.0.0.x --rand-dest -I eth0
```

* Intercepter le trafic contenant des signatures HTTP
```
$ hping3 -9 HTTP -I eth0
```

* SYN floodind
```
$ hping3 -S 10.0.0.25 -a 10.0.0.1 -p 22 --flood 
```