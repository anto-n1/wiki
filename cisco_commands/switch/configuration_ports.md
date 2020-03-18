# Configuration des ports de commutateur

## Mode bidirectionnel et vitesse

* **Configurer mode et vitesse**
	```
	(config)# interface fastethernet 0/1
	(config-if)# duplex full
	(config-if)# speed 100
	(config-if)# end
	```
	Speed peut prendre comme valeurs auto, 10, 100 ou 1000.  
	Duplex peut prendre comme valeur auto, half ou full.

* **Configurer la fonction auto-MDIX**
	```
	(config)# interface fastethernet 0/1
	(config-if)# duplex auto
	(config-if)# speed auto
	(config-if)# mdix auto
	(config-if)# end
	```

* **Examiner le paramètre auto-MDIX**
	```
	# show controllers ethernet-controller | include Auto-MDIX
	```