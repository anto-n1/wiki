# Routage entre vlan

Un périphérique qui prend en charge le routage de couche 3, tel qu’un routeur ou un commutateur multicouche, permet d’exécuter les fonctions de routage nécessaires. Quel que soit le périphérique utilisé, le processus de transfert du trafic réseau d’un VLAN à un autre à l’aide du routage est appelé routage inter-VLAN.

Il existe 3 options de routage inter-VLAN :

* Routage inter-VLAN existant
* Router-on-a-Stick
* Commutation de couche 3 à l’aide d’interfaces SVI

## Routage inter-vlan existant

Traditionnellement, la première solution de routage inter-VLAN reposait sur des routeurs dotés de plusieurs interfaces physiques. Chaque interface devait être connectée à un réseau distinct et configurée pour un sous-réseau différent.

Selon cette approche, le routage inter-VLAN s’effectue par la connexion de différentes interfaces de routeur physiques à différents ports de commutateur physiques. Les ports de commutateur connectés au routeur sont placés en mode d’accès et chaque interface physique est affectée à un VLAN distinct. Chaque interface de routeur peut alors accepter le trafic du VLAN associé à l’interface de commutateur à laquelle elle est connectée, et le trafic peut être acheminé vers les autres VLAN connectés aux autres interfaces.

## Router-on-a-stick

Alors que le routage inter-VLAN existant nécessite plusieurs interfaces physiques à la fois sur le routeur et sur le commutateur, une méthode moderne plus courante permet de l’éviter. En effet, grâce à un logiciel du routeur, il est possible de configurer une interface de routeur en tant que liaison trunk, ce qui signifie qu’une seule interface physique est requise sur le routeur et sur le commutateur pour acheminer les paquets entre plusieurs VLAN.

La méthode « router-on-a-stick » est un type de configuration de routeur dans laquelle une seule interface physique achemine le trafic entre plusieurs VLAN d’un réseau.

L’interface de routeur est configurée pour fonctionner comme une liaison trunk et elle est connectée à un port de commutateur configuré en mode trunk. Le routeur effectue le routage inter-VLAN en acceptant le trafic étiqueté VLAN sur l’interface trunk provenant du commutateur adjacent. Il procède ensuite au routage en interne entre les VLAN à l’aide de sous-interfaces. Le routeur transfère alors le trafic acheminé, étiqueté VLAN vers le VLAN de destination, depuis la même interface physique utilisée pour recevoir le trafic.

Les sous-interfaces sont des interfaces virtuelles basées sur un logiciel, associées à une interface physique unique. Les sous-interfaces sont configurées dans le logiciel sur un routeur et chaque sous-interface est configurée indépendamment avec une adresse IP et une affectation VLAN. Les sous-interfaces sont configurées pour différents sous-réseaux correspondant à leur affectation VLAN afin de faciliter le routage logique. Une fois qu’une décision de routage a été prise en fonction de la destination VLAN, les trames de données sont étiquetées VLAN et renvoyées depuis l’interface physique.
