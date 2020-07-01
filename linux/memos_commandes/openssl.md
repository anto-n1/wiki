# OpenSSL

**Notes et informations sur OpenSSL**

## Gestion certificats

### Côté client

* Générer une clé privée  
```openssl genrsa -out name-key.key 2048```

* Générer une clé publique à partir de la clé privée  
```openssl rsa -in name-key.key -pubout -out name-key.pub``` 

* Inspecter la clé  
```openssl rsa -in name-key.key -noout -text```

* Générer un CSR (demande de signature de certificat)  
```openssl req -new -key name-key.key -out name-key.csr```

### Côté serveur CA

* Générer clé privée pour la CA  
```openssl genrsa -out ca.key 2048```

* Générer certificat autosigné pour la CA  
```openssl req -new -x509 -key ca.key -out ca.crt```

* Signer un certificat  
```openssl x509 -req -in name-key.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out name-crt.crt```

* Avoir des informations sur les certificats  
```openssl x509 -in name-crt.crt -noout -text```

## Chiffrement fichiers

* Chiffrer un fichier  
```openssl enc -e -aes-256-cbc -in fichier-a-chiffrer.tar -out fichier-chiffre -pass pass:motdepasse```  
L'option -pass est optionelle, si non renseigné, le mot de passe est demandé à l'utilisateur via le CLI.  

* Déchiffrer un fichier  
```openssl enc -d -aes-256-cbc -in fichier-chiffre.txt -out fichier-dechiffre```

<br><br><br>
Dernière modification le 01/02/2020.
