# Rebond SSH

Configuration d'une connexion SSH à travers un rebond sur une machine pour rendre ce procédé simple et automatique.

Editer le fichier **.ssh/config** dans son répertoire home et ajouter ses machines en respectant la syntaxe suivante :

```
Host rebond
  Hostname 192.168.1.10
  User utilisateur
  Port 22
  IdentityFile /home/$USER/.ssh/id_rsa.pub

Host cible
  Hostname 172.16.10.10
  User utilisateur
  ProxyCommand ssh rebond "nc -q 0 `basename %h` %p"
```

Lorsque je veux me connecter à la machine cible en passant par le rebond, je peux taper la commande ```ssh cible```.