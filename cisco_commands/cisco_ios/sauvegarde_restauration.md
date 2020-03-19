# Sauvegarde et restauration

## Configuration running-config

### Via TFTP

* **Sauvegarde via TFTP**
	```
	# copy running-config tftp
	Remote host ? 192.168.1.1
	```

* **Restauration via TFTP**
	```
	# copy tftp running-config
	```

### Via USB

* **Sauvegarde via USB**
	```
	# copy running-config usbflash0:
	```

* **Restauration via USB**
	```
	# copy usbflash0:/file_name running-config
	```

## Configuration de l'image IOS

### Serveur TFTP

* **Sauvegarde de l'image sur un TFTP**
	```
	# copy flash0: tftp:
	```
