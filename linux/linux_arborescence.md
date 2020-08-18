# Arborescence d'un système Linux

Description de l'arborescence d'un système Linux.  
Comprendre le nom des répertoires et leur utilité.  

|       Répertoire      |     Signification           |                      Description                                                                          |
|-----------------------|-----------------------------|-----------------------------------------------------------------------------------------------------------|
| /                     |                             | Racine : point d'entrée du système                                                                        |
| /boot                 | boot                        | Contient le noyau Linux et l'amorceur                                                                     |
| /bin                  | binaries                    | Contient les exécutables de base (mv, cp, ls...)                                                          |
| /dev                  | devices                     | Contient les fichiers spéciaux qui permettent le lien avec les périphériques (écran, souris, clavier...)  |
| /etc                  | editable text configuration | Contient les fichiers de configuration du système                                                         |
| /home                 | home                        | Contient les répertoires utilisateurs                                                                     |
| /lib                  | librairies                  | Contient les librairies et les modules du noyau (/lib/modules)                                            |
| /media                | medias                      | Contient les points de montage des médias usuels : CD, disques durs, clés USB...                          |
| /root                 | root                        | Répertoire utilisateur de root                                                                            |
| /sbin                 | Super-Binaries              | Contient les exécutables destinés à l'administrateur du système                                           |
| /tmp                  | temporary                   | Contient des fichiers temporaires utilisés par certains programmes (vidé à chaque redémarrage)            |
| /usr                  | UNIX System Resources       | Programmes utilisés par les utilisateurs (à l'opposé des programmes utilisés par le système)              |
| /mnt                  | mount                       | Contient des fichiers et points de montage temporaires                                                    |
| /opt                  | optional add-on software    | Contient les programmes qui ne respectent pas les standards Linux (souvent propriétaires)                 |
| /var                  | variable                    | Contient des fichiers/variables systèmes qui varient, ainsi que le cache et fichiers journaux             |
| /srv                  | serve                       | Contient des fichiers statiques dédiés aux serveurs (FTP, HTTP...)                                        |
| /run                  | runtime                     | Stocker les fichiers d'applications qui tournent                                                          |
