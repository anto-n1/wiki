# Footprinting via moteurs de recherche

Les moteurs de recherche retournent des **SERPs**, des Search Engine Results Pages.  

Les moteurs de recherche principaux sont [Google](https://www.google.com), [Yahoo](https://fr.yahoo.com), 
[Bing](https://www.bing.com), [Ask](https://uk.ask.com), [Aol](https://search.aol.co.uk), [Baidu](http://www.baidu.com), 
[DuckDuckGo](https://duckduckgo.com), [Qwant](https://qwant.com), [Startpage](https://www.startpage.com).  

## Advanced search operatos

### A quoi ça sert ?

Chaque moteur dispose d'opérateurs de recherche avancée permettant d'affiner ses recherches.
Cela est souvent appelé **Google Hacking**. C'est l'art de créer des recherches complexes qui 
révèlent des informations cachés dans les fins fonds d'internet.  

Le Google Hacking permet entre autres de trouver/identifier/:
* Messages d'erreurs et informations sensibles
* Fichiers comprenant des mots de passe
* Répertoires sensibles
* Pages de login
* Pages contenant des vulnérabilités ou logs
* Version des logiciels
* Code source des applications web

Il faut aussi utiliser l'outil graphique de recherches avancée de Google : [google.com/advanced_search](https://www.google.com/advanced_search ).  
L'outil [Exploit DB](https://wwww.exploit-db.com) regroupe nottament des informations sur le GHDB et les opérateurs utiles.

En tant que hacker ethique, il faut signaler les contenus qui révèlent des informations sensibles à 
propos d'entreprise/personnes pour les supprimer de l'indexation des moteurs.  

Le site [googleguide.com](http://googleguide.com) répertorie les opérateurs de recherche utilisables sur Google.  

### Les opérateurs

Les opérateurs s'utilise sous la forme ```operator:search_term```, attention à ne pas mettre d'espace.  

Les opérateurs sont les suivants :
* allinurl : restreint les résultats uniquement aux pages contenant les termes dans l'URL (même les mots séparés par des espaces)
* inurl : comme allinurl mais cherche uniquement sur le mot suivant l'opérateur
* site : affiche uniquement les résultats trouvés qui sont sur le nom de domaine
* allintitle : restreint les résultats uniquements aux pages contenant les mots dans le titre de la page
* intitle : comme allintitle mais cherche uniquement sur le mot suivant l'opérateur
* inanchor : affiche les résultats si ils sont dans des ancres liens
* allinanchor : même principe que les autres all
* cache : affiche la version de la page web en cache sur les serveurs Google plutôt que la version actuelle
* link : recherche les pages qui contiennent le lien, impossible de combiner ce mot clé avec d'autres termes
* related : affiche les sites similaires ou qui ont un lien avec l'URL spécifiée
* info : affiche les informations à propos de la page
* location : trouve des informations à propos de la localisation
* filetype : affiche des fichiers en fonctions de l'extension précisée

### Exemples d'opérateurs

Exemples pour trouver des infos à propos de VoIP :


|                         **Google Dork**                           |                  **Description**                 |
|:-----------------------------------------------------------------:|:------------------------------------------------:|
| intitle:"Login Page" intext:"Phone Adapter Configuration Utility" | Pages containing login portal                    |
| inurl:/voice/advanced/ intitle:Linksys SPA configuration          | Finds the Linksys VoIP router configuration page |
| intitle:"D-Link VoIP Router" "Welcome"                            | Pages containing D-Link login portals            |
| intitle:asterisk.management.portal web-access                     | Look for the Asterisk management portal          |
| inurl:”NetworkConfiguration” cisco                                | Find the Cisco phone detail                      |
| inurl:”ccmuser/logon.asp”                                         | Find Cisco call manage                           |
| intitle:asterisk.management.portal web-access                     | Finds the Asterisk web management port           |
| inurl:8080 intitle:”login” intext:”UserLogin” “English”           | VoIP login portals                               |
| intitle:” SPA Configuration”                                      | Search Linksys phones                            |

Exemples pour trouver des infos à propos de VPN :

|                         **Google Dork**     |                                         **Description**                            |
|:-------------------------------------------:|:----------------------------------------------------------------------------------:|
| filetype:pcf "cisco" "GroupPwd"             | Cisco VPN files with Group Passwords for remote access                             |
| "[main]" "enc_GroupPwd=" ext:txt            | Finds Cisco VPN client passwords (encrypted, but easily cracked!)                  |
| "Config" intitle:"Index of" intext:vpn      | Directory with keys of VPN servers                                                 |
| inurl:/remote/login?lang=en                 | Finds FortiGate Firewall's SSL-VPN login portal                                    |
| !Host=*.* intext:enc_UserPassword=* ext:pcf | Look for .pcf files which contains user VPN profiles                               |
| filetype:rcf inurl:vpn                      | Finds Sonicwall Global VPN Client files containing sensitive information and login |
| filetype:pcf vpn OR Group                   | Finds publicly accessible profile configuration files (.pcf) used by VPN clients   |