# Firejail

[Firejail](https://firejail.wordpress.com) permet de lancer
des applications dans des sandbox sur Linux.

## Configuration de Firejail

Si on ne précise par de profile à utiliser pour les applications,
ce sont les profiles par défaut qui sont utilisés.

Les profiles de base sont situés dans /etc/firejail/\*.profile.
Possibilité d'ajouter des profiles dans ce répertoire ou dans
/home/$USER/.config/firejail/.

## Lacement CLI temporaires

Interdiction d'accéder à internet pour une application :

```bash
firejail --net=none application
```

Démarrer une app comme si c'était la première fois, et ne pas
rendre persistant les configurations des apps :

```bash
firejail --private firefox
firejail --private=/tmp/ firefox
```

## Lancement via GUI

Pour plus de confort, modifier fichiers desktop pour
sandboxer les application ouvertes via interface graphique.

Interdiction d'accès au réseau pour Visual studio code / Sublime Text:

```bash
vim /usr/share/applications/code.desktop
Exec=firejail --net=none /usr/share/code/code --no-sandbox --unity-launch %F
vim /usr/share/applications/sublime_text.desktop
Exec=firejail --net=none /opt/sublime_text/sublime_text %F
```

Utilisation du profile par défaut pour Chromium :

```bash
vim /usr/share/applications/chromium-browser.desktop
Exec=firejail /usr/bin/chromium-browser %U
```

Utilisation du profile par défaut pour Firefox :

```bash
vim /usr/share/applications/firefox.desktop
Exec=firejail firefox %u
```