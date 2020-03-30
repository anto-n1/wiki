# Whois - traceroute


## Whois 

Whois (contraction de l'anglais who is?, signifiant « qui est ? ») est un service de recherche fourni par les registres Internet, par exemple les Registres Internet régionaux (RIR) ou bien les registres de noms de domaine permettant d'obtenir des informations sur une adresse IP ou un nom de domaine. Ces informations ont des usages très variés, que ce soit la coordination entre ingénieurs réseaux pour résoudre un problème technique, ou bien la recherche du titulaire d'un nom de domaine par une société qui souhaiterait l'obtenir.

Whois écoute sur le port 43 et retourne les informations suivantes :

* Détails sur le nom de domaine
* Contacts du propriétaire du nom de domaine
* Serveur DNS
* Date de création du domaine
* Expiration
* Voir 

Whois est défini dans la [RFC 2167](https://tools.ietf.org/html/rfc2167).

Les différents RIR (Regional Internet Registries) sont :

* **LACNIC** = Latin American and Caribbean Network Information Center -> administre les ressources et IP en Amérique Latine et dans les Caraïbes
* **RIPE NCC** = Réseaux IP Européens Network Coordination Center -> administre les IP sur le territoire européen
* **AFRINIC** = African Network Information Center -> administre les adresses IP en Afrique
* **APNIC** = Asia Pacific Network Information Center -> administre les adresses IP en Asie
* **ARIN** = American Registry for Internet Numbers -> administre les adresses IP en Amérique

Des outils en ligne sont disponibles pour faciliter la compréhension des whois comme [Whois DomainTools](http://whois.domaintools.com).

## Traceroute

Le traceroute utilise le protocole ICMP et le concept de TTL (Time To Live) de l'entête IP pour trouver le chemin utilisé pour aller contacter un hôte. Il peut sortir le nombre de routeurs traversés, le temps passé entre deux routeurs, le nom des routeurs (si ils ont un nom DNS). Chaque routeur désincrémente le TTL dans l'en-tête IP, si celui-ci arrive à 0, le routeur renvoie un ICMP error.

Les traceroute permettent nottament de détecter les pertes de paquet, les problèmes réseau, ou encore les performances du réseau.

Des outils graphiques permettent d'analyser les routes et les afficher sous formes visuelles. [Path Analyzer](http://www.pathanalyzer.com), [VisualRoute](http://www.visualroute.com) sont deux clients lourds permettant de réaliser ça.