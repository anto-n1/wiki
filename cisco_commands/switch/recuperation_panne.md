# Récupération après panne système d'un switch

Le bootloader (chargeur de démarrage) permet d'accéder au commutateur si le système d'exploitation ne peut pas être chargé, notamment si des fichiers système sont manquants ou endommagés. Il dispose d'une ligne de commande qui permet l'accès aux fichiers stockés dans la mémoire Flash.

Pour accéder au bootloader :

1. Connecter un PC par le câble de console au port de console du commutateur et accéder à celui-ci via minicom ou autre.

2. Débrancher le cordon d'alimentation du commutateur.

3. Reconnecter le cordon d'alimentation au commutateur et, dans les 15 secondes suivantes, appuyer sur le bouton Mode et le maintenir enfoncé tandis que la LED système clignote en vert.

4. Continuer à appuyer sur le bouton Mode jusqu’à ce que la LED système devienne orange, puis vert fixe. Relâcher ensuite le bouton Mode.

5. L'invite switch: du bootloader s'affiche dans le logiciel d'émulation de terminal sur le PC.

La ligne de commande du bootloader prend en charge des commandes qui permettent de formater le système de fichiers Flash, de réinstaller le système d'exploitation et de récupérer un mot de passe perdu ou oublié. Par exemple, la commande ```dir``` peut être utilisée pour afficher la liste des fichiers dans un dossier spécifique.
