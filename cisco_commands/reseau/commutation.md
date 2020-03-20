# Commutation

Un commutateur **store and forward** reçoit l'intégralité de la trame, calcule le CRC, si celui-ci est valide, il recherche l'adresse de destination, détermine l'interface de sortie pui envoie la trame.

Un commutateur **cut-through** achemine la trame avant qu'elle ne soit complètement reçue. Au minimum, l'adresse de destination de la trame doit être connue.

Il peut être en **fragment free** : une forme modifiée du cut-through, qui attend la fin de la réception de la fenêtre de collision (64 octets) avant de tra,sférer la trame. 

## Commutateur

Les trois couches du modèle de conception hiérarchique de commutateur :

* Liaison de données
* Coeur de réseau
* Accès réseau

La couche d'accès est la plus basse, permet aux utilisateurs d'accéder au réseau.  
La couche de distribution comporte de nombreuses fonctionnalités, mais elle regroupe les données de la couche d'accès, permet le filtrage, le contrôle des stratégies et définit les limites de routage de couche 3.  
La couche cœur de réseau assure une connectivité haut débit.