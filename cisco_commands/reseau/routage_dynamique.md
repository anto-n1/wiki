# Routage dynamique

Les chemins de routes dynamiques sont calculés en fonction de différents paramètres selon les protocoles :
* bande passante
* coût
* délai
* sauts

## Avantages et inconvénients

### Avantages

* Approprié pour les topologies comprenant plusieurs routeurs
* Indépendant de la taille du réseau
* Adapte automatiquement une topologie pour réacheminer le trafic si possible

### Inconvénients

* Peut être assez complexe à mettre en oeuvre
* Moins sécurisé que statique car envoie des messages
* Nécessite des ressources supplémentaires en terme de processeur, RAM, bande passante

## Protocoles de routage dynamique

### RIP

Le RIPv1 ne prend pas en compte les sous réseaux et classes. Le RIPv2 en est capable.  
Le RIPv1 il n'envoie que des messages RIPv1, mais est capable d'interpréter les messages reçus en RIPVv, cependant, il ignore les champs RIPv2 dans l'entrée de route.