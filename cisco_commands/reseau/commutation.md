# Commutation

Un commutateur **store and forward** reçoit l'intégralité de la trame, calcule le CRC, si celui-ci est valide, il recherche l'adresse de destination, détermine l'interface de sortie pui envoie la trame.

Un commutateur **cut-through** achemine la trame avant qu'elle ne soit complètement reçue. Au minimum, l'adresse de destination de la trame doit être connue.

Il peut être en **fragment free** : une forme modifiée du cut-through, qui attend la fin de la réception de la fenêtre de collision (64 octets) avant de tra,sférer la trame. 