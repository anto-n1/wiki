# Undo persistant dans Vim

Cette page explique comment rendre Vim persistant et pouvoir effectuer des "ctrl-z", ou "u" même après avoir ```:wq``` un fichier.

1. On créé un dossier dans lequel seront placés les sauvegardes des actions effectuées sur un fichier.  

Etape non obligatoire mais si pas de dossier précisé, l'historique est stocké au même endroit que le fichier édité avec vim.

```
mkdir -p /home/$USER/.vim/undodir
```

2. On edit le fichier ```.vimrc``` et on ajoute les deux lignes suivantes

Deuxième ligne uniquement si on a créé un dossier prévu pour stocker les historiques.

```
set undofile
set undodir=~/.vim/undodir
```