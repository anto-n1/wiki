# Licences Cisco

* **Afficher la licence**
	```
	# show licence udi
	```

* **Installer une licence**
	```
	# licence install flash0:securityk9-CISCO1941-FHH12250057.lic
	# reload
	```

 **Vérifier une licence**
 	```
 	# show version
 	# show licence
 	```

 * **Sauvegarder une licence**
 	```
 	# licence save file-syc://lic-location
 	```

 * **Désinstaller une licence**
 	```
 	(config)# licence boot module module-name technology-package package-name disable
 	```

 * **Effacer une licence**
 	```
 	# licence clear feature-name
 	```