# Access Lists routeurs

## A quoi servent les ACL ?

Une liste de contrôle d'accès (ou ACL) est une série de commandes IOS qui déterminent si un routeur achemine ou abandonne les paquets en fonction des informations contenues dans l'en-tête de paquet. Les listes de contrôle d'accès font partie des fonctionnalités les plus utilisées du logiciel Cisco IOS.

Une fois configurées, les listes de contrôle d'accès assurent les tâches suivantes :

* Elles limitent le trafic réseau pour accroître les performances réseau. Si la stratégie de l’entreprise interdit, par exemple, le trafic vidéo sur le réseau, vous pouvez configurer et appliquer des listes de contrôle d’accès pour bloquer ce trafic. Ainsi, la charge réseau est nettement réduite et les performances réseau sont sensiblement améliorées.

* Elles contrôlent le flux de trafic. Les listes de contrôle d’accès peuvent limiter la diffusion des mises à jour de routage pour s’assurer que les mises à jour viennent d'une source reconnue.

* Elles fournissent un niveau de sécurité de base pour l’accès réseau. Les listes de contrôle d’accès permettent à un hôte d’accéder à une section du réseau tout en empêchant un autre hôte d’y avoir accès. Par exemple, l'accès au réseau du département Ressources humaines peut être limité aux utilisateurs autorisés.

* Elles filtrent le trafic en fonction de son type. Ainsi, une liste de contrôle d'accès peut autoriser le trafic des e-mails, mais bloquer tout le trafic Telnet.

* Elles filtrent les hôtes pour autoriser ou refuser l’accès aux services sur le réseau. Les listes de contrôle d’accès peuvent autoriser ou refuser à un utilisateur l’accès à certains types de fichier, tels que FTP ou HTTP.

Par défaut, aucune liste de contrôle d'accès n'est configurée sur les routeurs. Par conséquent, les routeurs ne filtrent pas le trafic, par défaut. Le trafic qui entre dans le routeur est routé uniquement en fonction des informations de la table de routage. Toutefois, lorsqu'une liste de contrôle d'accès est appliquée à une interface, le routeur évalue en outre tous les paquets réseau lorsqu'ils traversent l'interface pour déterminer s'ils peuvent être acheminés.

En dehors de l'autorisation ou du blocage du trafic, les listes de contrôle d'accès peuvent être utilisées pour sélectionner les types de trafic à analyser, à acheminer et à traiter selon d'autres méthodes. Par exemple, les listes de contrôle d'accès permettent de classer le trafic par ordre de priorité. Cette fonction s'assimile à une carte VIP pour un concert ou un événement sportif. La carte VIP offre aux spectateurs privilégiés des avantages qui ne sont pas proposés aux détenteurs d'un billet standard, notamment l'entrée prioritaire ou le droit d'accéder à une zone privée.

## Fonctionnement des ACL

Les listes de contrôle d’accès peuvent être configurées pour les appliquer au trafic entrant et au trafic sortant comme illustré dans la figure.

* **Listes de contrôle d'accès entrantes** : les paquets entrants sont traités avant d'être routés vers l'interface de sortie. Une liste de contrôle d’accès entrante est efficace car elle réduit la charge des recherches de routage en cas d’abandon du paquet. Si le paquet est autorisé par la liste de contrôle d'accès, il est alors traité pour le routage. Les listes de contrôle d'accès entrantes sont idéales pour filtrer les paquets lorsque le réseau relié à une interface d'entrée est la seule source des paquets devant être inspectés.

* **Listes de contrôle d'accès sortantes** : les paquets entrants sont acheminés vers l'interface de sortie, puis traités par le biais de la liste de contrôle d'accès sortante. Les listes de contrôle d'accès sortantes sont particulièrement efficaces lorsqu'un même filtre est appliqué aux paquets provenant de plusieurs interfaces d'entrée avant de quitter la même interface de sortie.

## Bien utiliser les ACL

| Directive                                                              |                       Avantage                                                        |
|------------------------------------------------------------------------|---------------------------------------------------------------------------------------|
| Créer ACL conformément à la stratégie sécurité d'entreprise            | Etre certain d'implémenter les instructions relatives à la sécurité organisationnelle |
| Préparer description des tâches que devront effectuer les ACL          | Eviter de créer des roblèmes d'accès par mégarde                                      |
| Utiliser un editeur de texte pour créer, modifier, enregistrer les ACL | Créer une bibliothèque d'ACL réutilisable                                             |
| Tester les ACL avant de les mettre en prod                             | Eviter de commettre des erreurs coûteuses                                             | 