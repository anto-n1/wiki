# DNS - Domain Name System

Les DNS fournissent des informations comme des adresses IP, noms de domaines, zones DNS, noms d'ordinateurs.

Le tableau suivant montre les types d'enregistrements et leur description :

| Enregistrement DNS | Description                                                         |
|--------------------|---------------------------------------------------------------------|
| A                  | Renvoie une IP pour un nom de host donné                            |
| MX                 | Pointe vers un nom de domaine de serveur mail                       |
| NS                 | Délègue la gestion d'une zone à un serveur DNS faisant autorité     |
| CNAME              | Réaliser l'alias d'un hôte vers un autre                            |
| SOA                | Définit le serveur maître du domaine                                |
| SRV                | Définit un serveur spécifique pour une app, permet le loadbalancing |
| PTR                | Réalise l'inverse A ou AAAA : donne un hostname pour une IP         |
| RP                 | Responsible Person : personne responsable du serveur                |
| HINFO              | Spécifie le CPU et l'OS du serveur                                  |
| TXT                | Chaîne de caractères, on met ce que l'on veut                       |

Les outils existant pour extraire des informations via les requêtes DNS sont nottament [Kloth](http://www.kloth.net), [CentralOps](https://centralops.net/co), [DNSWatch](https://www.dnswatch.info), [Fierce](https://github.com/mschwager/fierce) ou encore [MXToolbox](https://mxtoolbox.com).