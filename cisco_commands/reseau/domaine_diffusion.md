# Domaine de diffusion

Un ensemble de commutateurs interconnectés constitue un domaine de diffusion unique. Seul un périphérique de couche réseau, tel qu'un routeur, peut diviser un domaine de diffusion de couche 2. Les routeurs sont utilisés pour segmenter les domaines de diffusion, mais ils segmentent également les domaines de collision.

Lorsqu'un périphérique envoie une diffusion de couche 2, l'adresse MAC de destination de la trame est remplie de 1 binaires.

Le domaine de diffusion de couche 2 est appelé domaine de diffusion MAC. Le domaine de diffusion MAC est constitué de tous les périphériques du réseau local qui reçoivent les trames de diffusion provenant d'un hôte.

Lorsqu'un commutateur reçoit une trame de diffusion, il la transfère à tous ses ports, sauf au port d'entrée où elle a été reçue. Chaque périphérique connecté au commutateur reçoit un exemplaire de la trame de diffusion et la traite. Les diffusions sont parfois nécessaires pour localiser initialement d'autres équipements et services réseau, mais elles réduisent l'efficacité du réseau. La bande passante du réseau est utilisée pour transmettre le trafic de diffusion. Un nombre de diffusions et une charge de trafic trop élevés sur un réseau peuvent entraîner un encombrement qui ralentit les performances réseau.

Lorsque deux commutateurs sont interconnectés, le domaine de diffusion augmente.