# Prise d'empreinte à partir des sites internet

Les sites internet des entreprises peuvent dévoiler de nombreuses informations sensibles comme des noms, contacts, patrons, projets à venir...  

Examiner le code source des pages peut révéler des informations. Les commentaires peuvent révéler des informations sur les logiciels qui tournent en arrière-plan, mais aussi des noms et contacts. L'observation des liens permet de maper le site et parfois de trouver des liens cachés. Enfin, entrer des fake data permet de déterminer comment les scripts fonctionnent. L'examination des cookies peut révéler des noms de domaines, des noms, des valeurs.

Des outils permettent de réaliser des prises d'empreintes sur ces sites et en les clonant. Il est possible de réaliser des map détaillées des sites.

La prise d'empreinte de sites donne les informations suivantes :

* Logiciels et versions utilisées
* OS utilisés
* Découvrir les sous dossiers et paramètres 
* Noms de fichiers, chemins, injections SQL
* Plateforme de script
* CMS et détails de contacts

Les outils à utiliser pour ça sont :

* [Burp Suit](https://portswigger.net) : tests de sécurité sur des applications web : mapping, analyse de la surface d'attaque, recherche de vulnérabilités
* [Zaproxy](https://www.zaproxy.org/) : trouver des vulnérabilités sur des applications web

## Web spiders - Web crawler - Web robot

Les web spiders, crawler, ou encore robot sont des programmes et scripts automatiques qui parcourent les sites internet pour récupérer des informations. Cette technique n'est pas possible si le site internet possède un robots.txt, avec une liste des répertoires pour prévenir du crawling.  

Les outils existants pour le crawling sont :

* [Web data extractor](http://www.webextractor.com) : crawler pour extraire des informations sur des sites internet