# Routage statique

## Avantages et inconvénients

### Avantages

* Facile à implémenter dans un petit réseau
* Sécurisé car aucun message envoyé
* Route menant à destination est toujours la même
* Pas de mécanisme d'algorithme de routage ou de mise à jour : pas de ressouce nécessaire

### Inconvénients

* Convient uniquement aux petits réseaux et usages spécifiques
* Complexité de configurations augmente quand le réseau augmente
* Intervention manuelle nécessaire pour réacheminer le trafic

## Routes statiques flottantes

Les routes statiques flottantes sont des routes statiques qui ont une distance administrative supérieure à la distance administrative d'une autre route statique ou de routes dynamiques. Elles sont très utiles comme routes de secours pour une liaison principale.

Par défaut, les routes statiques ont une distance administrative égale à 1, ce qui les rend préférables aux routes acquises à partir des protocoles de routage dynamique. Par exemple, les distances administratives de certains protocoles de routage dynamique courants sont les suivantes :

| Protocole      | DA             |
|----------------|----------------|
| EIGRP          | 90             |
| IGRP           | 100            |
| OSPF           | 110            |
| IS-IS          | 115            |
| RIP            | 120            |
| Route statique | 1 (par défaut) |

La distance administrative d'une route statique peut être augmentée pour rendre la route moins souhaitable que celle d'une autre route statique ou d'une route apprise via un protocole de routage dynamique. De cette manière, la route statique « flotte » et n'est pas utilisée lorsque la route dont la distance administrative est meilleure est active. Toutefois, si la route préférée est perdue, la route statique flottante peut relayer, et le trafic peut être envoyé par cette autre route.

Même si un protocole a une distance administrative de valeur supérieure (moins fiable), la meilleure correspondance est la route dans la table de routage qui présente le plus grand nombre de bits de poids fort identiques.