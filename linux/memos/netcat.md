# Netcat

### Les options

* **-l** : listen, écouter connexion entrante
* **-n** : nodns, ne pas résoudre les noms DNS
* **-p** : port
* **-e** ou **--exec** : suivi d'une commande (ex /bin/bash)

Ouvrir listener et envoyer un fichier lors d'une connexion :
```bash
root@kali:~# cat fichier.html
Je veux renvoyer cette page web.
root@kali:~# netcat -l -p 12345 < ./fichier.html
```

Ouvrir un listener :
```bash
nc -nvv -l -p 1234 -e /bin/bash
```

Se connecter à un listener :
```bash
nc 192.168.56.123 1234
```
