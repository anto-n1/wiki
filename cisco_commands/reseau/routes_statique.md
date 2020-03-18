# Routes statiques

## Routes statiques flottantes

Les routes statiques flottantes sont des routes statiques qui ont une distance administrative supérieure à la distance administrative d'une autre route statique ou de routes dynamiques. Elles sont très utiles comme routes de secours pour une liaison principale.

Par défaut, les routes statiques ont une distance administrative égale à 1, ce qui les rend préférables aux routes acquises à partir des protocoles de routage dynamique. Par exemple, les distances administratives de certains protocoles de routage dynamique courants sont les suivantes :
* EIGRP = 90
* IGRP = 100
* OSPF = 110
* IS-IS = 115
* RIP = 120

La distance administrative d'une route statique peut être augmentée pour rendre la route moins souhaitable que celle d'une autre route statique ou d'une route apprise via un protocole de routage dynamique. De cette manière, la route statique « flotte » et n'est pas utilisée lorsque la route dont la distance administrative est meilleure est active. Toutefois, si la route préférée est perdue, la route statique flottante peut relayer, et le trafic peut être envoyé par cette autre route.