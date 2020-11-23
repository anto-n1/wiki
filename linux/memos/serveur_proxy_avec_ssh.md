# Serveur proxy avec SSH

Cette page explique comment utiliser un serveur SSH en tant que serveur proxy.  
Pratique pour sortir d'un réseau public de manière sécurisée ou contourner des règles de sécurité sur certains réseaux.

### Etapes pour utiliser un serveur SSH en tant que proxy

1. **Connaître mon IP publique avec mon client**
```
curl ifconfig.me
```

2. **Connexion au serveur SSH avec le client**  
Utiliser -D pour définir le port du proxy (veiller à utiliser un port autorisé sur le réseau sur lequel on est : 80, 100, 443)
```
ssh user@serveur-ssh -D 8080
```
Tant que cette connexion est active, le proxy est utilisable, si on coupe la connexion, le prox n'eyst plus disponible.

3. **Changer les paramètres proxy dans le navigateur, ou bien pour tout le système**    
Utiliser l'adresse 127.0.0.1 avec le port définit avec -D (ici 8080) dans la commande de connexion au serveur SSH. Attention à utiliser un serveur proxy SOCKS.

4. **Vérifier que mon ip est différente** de tout à l'heure en relançant un curl sur ifconfig.me