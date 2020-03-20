# Routage

## Routes

![Routes explications](.images/explication_route.png "Routes explications")  

## Code et protocole associé

Correspondance des codes et des protocoles de routage dans IOS :

| Protocole/Etat                 | Lettre |
|--------------------------------|--------|
| Connecté directement           | C      |
| EIGRP                          | D      |
| EIGRP externe                  | EX     |
| Statique                       | S      |
| RIP                            | R      |
| OSPF                           | O      |

## En vrac

Une route statique entièrement spécifiée indique une adresse IP de tronçon suivant et une interface de sortie. Une route statique récursive n'indique que l'adresse IP de tronçon suivant. Une route statique connectée directement indique uniquement l'interface de sortie de routeur. Une route statique flottante dispose d'une métrique plus élevée que celle des routes dynamiques et sert de route de secours.

Un réseau d'extrémité est un réseau accessible par une seule route.

Si plusieurs routes disponibles vers une même destination avec un seul protocole de routage, le facteur pris en compte pour déterminer la meilleur route est la métrique la plus faible.

La fonction du routeur qui permet de transférer du trafic qui ne dispose pas d'une route spécifique est la passerelle de dernier recours.

L'équilibrage de la charge :
	* transférer des paquets sur plusieurs chemins vers le même réseau de destination
	* l’équilibrage de la charge à coût inégal est pris en charge par le protocole EIGRP

Dans une route statique récursive, seule l’adresse IPv6 du tronçon suivant est spécifiée.

Une route sur-réseau est une route qui comporte une adresse réseau avec un masque de sous-réseau inférieur à celui défini par l’adressage classful pour ce réseau. Si l’adresse réseau 192.168.1.0 utilisait un masque /16 (255.255.0.0), il serait inférieur à celui défini par l’adressage classful pour une adresse réseau 192.168.1.X. Une adresse récapitulative est un exemple de route sur-réseau.