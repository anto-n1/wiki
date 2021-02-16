# Metasploit

## Quelques définitions

**Module Exploit** : scripts ruby permettant d’exploiter une vulnérabilité sur une machine.  

**Module Payload** : code exécuté après s’être introduit dans la machine cible, il permet de contrôler la machine d’une victime. Exemple : ouverture d’un port sur la machine relié à un shell ou ouverture d'une session VNC.  

**Modules Axillaires** : utilisé pour diverses taches comme le scan de port, sniffing, scan de services. Une fois l’exploit et le Payload exécutés sur une machine vulnérable, possibilité de faire ce qu’on veut sur le système comme télécharger les données de la cible, mise en place d’un malware, capture d’écran, etc.  

## Commandes

Commandes utilisables quasiment partout :

```
search quelque_chose
```

Vérifier si un cible est exploitable avec l'exploit sélectionné :
```
use exploit
set rhosts 10.10.10.10
check
```

#### Exploit

```
show exploits
search nom_exploit
use nom_exploit
info nom_exploit
show options
```

#### Payload

```
show payload
set payload nom_payload
set rhost 192.168.1.1
show options
exploit
```