# GnuPG - GPG

# Chiffrer/Déchiffrer fichier

* Chiffrer un fichier :  
```gpg --cipher-algo AES256 --output fichier.encrypted --batch --passphrase-file /tmp/.passwd --symmetric fichier.to_encrypt```  

Le mot de passe doit être sur une seule ligne dans le fichier.  

* Déchiffrer un fichier :  
```gpg --cipher-algo AES256 --output fichier.txt --batch --passphrase-file /tmp/.passwd --decrypt fichier.encrypted```
